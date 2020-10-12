Sys.setenv(TZ='PST8PDT')

# Dependencias
# naives bayes, MSV
#install.packages('e1071')  
# AdaBoost
#install.packages('ada')
# Random Forest
#install.packages('randomForest')
# Arboles de decision
#install.packages('rpart')
# Knn  Metodo de los K vecinos mas cercanos
#install.packages('kknn')

# Funciones propias para complementar las funciones basicas de R

# Regresa el timestamp
timestamp_short <- function (){
  return(format(Sys.time(), ' %F %X'))
}

# Imprime multiples argumentos en pantalla y al final imprime un salto de linea
imprimir <- function(...){
  cat(..., '\n')
}

# Imprime el timestamp y multiples argumentos en pantalla y al final imprime un salto de linea
imprimir_con_timestamp <- function(...){
  cat(timestamp_short(), ..., '\n')
}

# Carga el archivo de datos
inicializar_datos <- function(nombre_de_archivo, cantidad_de_registros) {
  imprimir_con_timestamp('Inicia el proceso de importar el Dataset a R')
  tiempo_de_carga <- system.time( datos <- read.csv(nombre_de_archivo,sep = ',',dec='.',header=T, nrows=cantidad_de_registros))
  dimensiones <- dim(datos)
  cantidad_registros <- dimensiones[1]
  cantidad_columnas <- dimensiones[2]
  imprimir_con_timestamp('Dataset con', format(cantidad_registros,  big.mark = ','), 'registros y ',cantidad_columnas, 'columnas cargada en:', tiempo_de_carga[[3]], ' segundos es decir ',tiempo_de_carga[[3]]/60, ' minutos')
  
  # Convertimos la variable target de tipo numerico a tipo factor para poderla predecir en nuestros algoritmos
  datos <- transform(datos, target = as.factor(target))
  
  # Separamos los datos en 2, los datos de Entranamiento (data_entrenamiento) y los datos de Pruebas (data_pruebas)
  # para el dataset de Entrenamiento usaremos el 70% y para el dataset de pruebas el 30 %
  cantidad_pruebas  <- (cantidad_registros * 0.30)
  muestra <- sample(1:cantidad_registros, cantidad_pruebas)
  
  imprimir_con_timestamp('Creando el dataset de pruebas')
  data_pruebas <- datos[muestra, ]
  
  imprimir_con_timestamp('Creando el dataset de entrenamiento')
  data_entrenamiento <- datos[-muestra, ]
  
  imprimir_con_timestamp('Entrenamiento: ',length(data_entrenamiento[,1]), 'registros (70%)')
  imprimir_con_timestamp('Pruebas:        ',length(data_pruebas[,1]), 'registros (30%)')
  
  # Desasignamos la variable donde teniamos nuestro dataset original para liberar memoria
  rm(datos, muestra)
  
  return(list('cantidad_registros' = cantidad_registros, 'cantidad_columnas' = cantidad_columnas,  'data_pruebas' = data_pruebas, 'data_entrenamiento' = data_entrenamiento))
}

# Calcula el porcentaje de Aciertos / Errores de las maquinas de aprendizaje
calcular_resultados <- function(data_pruebas, cantidad_columnas, prediccion){
  imprimir_con_timestamp('Calculando la cantidad de aciertos')
  ## Se crea una Matriz de Confusion para hacer los calculos de aciertos / errores
  matriz_confusion <- table(data_pruebas[, cantidad_columnas], prediccion)
  imprimir_con_timestamp('Matriz de confusión')
  imprimir_con_timestamp('Verdaderos Negativos: ', matriz_confusion[1,1])
  imprimir_con_timestamp('Verdaderos Positivos: ', if(length(matriz_confusion[2,])==2) matriz_confusion[2,2] else '0')
  imprimir_con_timestamp('Falsos Positivos:     ',  matriz_confusion[2,1])
  imprimir_con_timestamp('Falsos Negativos:     ', if(length(matriz_confusion[1,])==2) matriz_confusion[1,2] else '0')
  acierto <- (sum(diag(matriz_confusion))) / sum(matriz_confusion) * 100
  imprimir_con_timestamp('Porcentaje de Aciertos:', acierto)
  error <- 100 - acierto
  imprimir_con_timestamp('Porcentaje de Errores: ', error)
  cantidad_errores = matriz_confusion[2,1] + if(length(matriz_confusion[1,])==2) matriz_confusion[1,2] else 0
  imprimir_con_timestamp('Errores de clasificación:',cantidad_errores,', sobre un total de', length(data_pruebas[,1]),'casos')
}

# Ejecuta la maquina de aprendizaje que se especifica y regresa el tiempo de ejecución
ejecutar_algoritmo <- function(nombre, funcion_ml, datos_entrenamiento, datos_pruba) {
  tiempo_ejecucion<- system.time(funcion_ml(data_entrenamiento, data_pruebas))
  segundos <- tiempo_ejecucion[[3]]
  imprimir_con_timestamp(nombre,'ejecutado en', segundos, 'segundos es decir', segundos/60, 'minutos')
  imprimir('\n')
}

# Creamos nuestas funciones que contienen los algoritmos

naive <- function(data_entrenamiento, data_pruebas) {
  suppressWarnings(suppressMessages(library(e1071)))
  imprimir_con_timestamp('Naive Bayes: iniciando el entrenamiento')
  tiempo_entrenamiento <- system.time(modelo <- naiveBayes(target ~ ., data = data_entrenamiento))
  imprimir_con_timestamp('Tiempo de entrenamiento:', tiempo_entrenamiento[[3]], ' segundos es decir ',
                         tiempo_entrenamiento[[3]]/60, ' minutos')
  imprimir_con_timestamp('Prediciendo resultados')
  tiempo_predicciones <- system.time(prediccion <- predict(modelo, data_pruebas[,-cantidad_columnas]))
  imprimir_con_timestamp('Tiempo de ejecución:', tiempo_predicciones[[3]], ' segundos es decir ',
                         tiempo_predicciones[[3]]/60, ' minutos')
  # Calcular e Imprimir los resultados de porcentaje de aciertos / errores
  calcular_resultados(data_pruebas, cantidad_columnas, prediccion)
}


redes_neuronales <- function(data_entrenamiento, data_pruebas) {
  suppressWarnings(suppressMessages(library(nnet)))
  imprimir_con_timestamp('Redes neuronales: iniciando el entrenamiento')
  tiempo_entrenamiento <- system.time(modelo <- nnet(target ~ ., data = data_entrenamiento, size = 4, 
                                                     maxit=100, trace = FALSE))
  imprimir_con_timestamp('Tiempo de entrenamiento:', tiempo_entrenamiento[[3]], ' segundos es decir ',
                         tiempo_entrenamiento[[3]]/60, ' minutos')
  imprimir_con_timestamp('Prediciendo resultados')
  tiempo_predicciones <- system.time(prediccion <- predict(modelo, data_pruebas[,-cantidad_columnas], 
                                                           type = 'class'))
  imprimir_con_timestamp('Tiempo de ejecución:', tiempo_predicciones[[3]], ' segundos es decir ',
                         tiempo_predicciones[[3]]/60, ' minutos')
  # Calcular e Imprimir los resultados de porcentaje de aciertos / errores
  calcular_resultados(data_pruebas, cantidad_columnas, prediccion)
}

arboles <- function(data_entrenamiento, data_pruebas) {
  suppressWarnings(suppressMessages(library(rpart)))
  imprimir_con_timestamp('Arboles de decisión: iniciando el entrenamiento')
  tiempo_entrenamiento <- system.time(modelo <- rpart(target ~ ., data = data_entrenamiento))
  imprimir_con_timestamp('Tiempo de entrenamiento:', tiempo_entrenamiento[[3]], ' segundos es decir ',
                         tiempo_entrenamiento[[3]]/60, ' minutos')
  imprimir_con_timestamp('Prediciendo resultados')
  tiempo_predicciones <- system.time(prediccion <- predict(modelo, data_pruebas, type = 'class'))
  imprimir_con_timestamp('Tiempo de ejecución:', tiempo_predicciones[[3]], ' segundos es decir ',
                         tiempo_predicciones[[3]]/60, ' minutos')
  # Calcular e Imprimir los resultados de porcentaje de aciertos / errores
  calcular_resultados(data_pruebas, cantidad_columnas, prediccion)
}

ada_boost <- function(data_entrenamiento, data_pruebas) {
  suppressWarnings(suppressMessages(library(ada)))
  imprimir_con_timestamp('AdaBoost: iniciando el entrenamiento')
  tiempo_entrenamiento <- system.time(modelo <- ada(target ~ ., data = data_entrenamiento, iter = 1))
  imprimir_con_timestamp('Tiempo de entrenamiento:', tiempo_entrenamiento[[3]], ' segundos es decir ',
                         tiempo_entrenamiento[[3]]/60, ' minutos')
  imprimir_con_timestamp('Prediciendo resultados')
  tiempo_predicciones <- system.time(prediccion <- predict(modelo, data_pruebas[, -cantidad_columnas]))
  imprimir_con_timestamp('Tiempo de ejecución:', tiempo_predicciones[[3]], ' segundos es decir ',
                         tiempo_predicciones[[3]]/60, ' minutos')
  # Calcular e Imprimir los resultados de porcentaje de aciertos / errores
  calcular_resultados(data_pruebas, cantidad_columnas, prediccion)
}

random_forest <- function(data_entrenamiento, data_pruebas) {
  suppressWarnings(suppressMessages(library(randomForest)))
  
  imprimir_con_timestamp('Random Forest: iniciando el entrenamiento')
  tiempo_entrenamiento <- system.time(modelo <- randomForest(target ~ ., data = data_entrenamiento,
                                                             importance = TRUE))
  imprimir_con_timestamp('Tiempo de entrenamiento:', tiempo_entrenamiento[[3]], ' segundos es decir ',
                         tiempo_entrenamiento[[3]]/60, ' minutos')
  
  imprimir_con_timestamp('Prediciendo resultados')
  tiempo_predicciones <- system.time(prediccion <- predict(modelo, data_pruebas[, -cantidad_columnas]))
  imprimir_con_timestamp('Tiempo de ejecución:', tiempo_predicciones[[3]], ' segundos es decir ',
                         tiempo_predicciones[[3]]/60, ' minutos')
  
  # Calcular e Imprimir los resultados de porcentaje de aciertos / errores
  calcular_resultados(data_pruebas, cantidad_columnas, prediccion)
}

# Inicializamos los datos que vamos a utilizar
variables <- inicializar_datos('/git/nodejs/proyecto/dataset.csv', 5000000)
cantidad_registros = variables$cantidad_registros
cantidad_columnas = variables$cantidad_columnas
data_pruebas = variables$data_pruebas
data_entrenamiento = variables$data_entrenamiento
# liberamos memoria
rm(variables)

imprimir('\n')
imprimir_con_timestamp('Iniciar la ejecución de los Algoritmos')
imprimir('\n')

# ejecutar_algoritmo('Random Forest', random_forest, data_entrenamiento, data_pruebas)
#  Can not handle categorical predictors with more than 53 categories. 

ejecutar_algoritmo('AdaBoost', ada_boost, data_entrenamiento, data_pruebas)
ejecutar_algoritmo('Arboles de decisión', arboles, data_entrenamiento, data_pruebas)
ejecutar_algoritmo('Redes Neuronales', redes_neuronales, data_entrenamiento, data_pruebas)
ejecutar_algoritmo('Naive Bayes', naive, data_entrenamiento, data_pruebas)
