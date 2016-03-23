## Trabajo con tablas: una introducción (parte II)

# En esta lección se van a mostrar algunos métodos básicos y muy útiles
# para resolver problemas comunes asociados al trabajo con tablas de datos y su
# manipulación.  Se cubren aspectos sencillos, tal como obtener información,
# efectuar cálculos por filas o columnas, etc.

# La mayoría de las veces es recomendable aprovechar los programas con los
# que uno se siente más cómodo para manipular nuestras tablas/bases de datos.
# De todas formas, existen varias funciones en R para manipular y explorar 
# tablas (data.frames), varias de las cuales pueden ser sumamente prácticas en
# muchos casos.

## Selección de Observaciones

# Muchas veces nos interesan, dentro de una tabla, sólo ciertas observaciones
# basadas con ciertos criterios. Generalmente existe la forma de expresar
# estos criterios utilizando operadores lógicos. De hecho ya hemos visto en la 
# unidad anterior cómo se pueden combinar estos con los corchetes para filtrar 
# vectores, matrices o data.frames.

# La función which sirve para además guardar en un objeto los índices de un 
# vector lógico para los cuales vale TRUE. Por ejemplo:

x <- which(cars$dist > 20)
x

# Aquí x tiene los números de fila de las observaciones que cumplen la 
# condición dada entre paréntesis. Entonces x se puede usar posteriormente 
# para quedarnos sólo con estas filas:

y <- cars[x,]
y

# Además, como se ha mostrado antes, también es posible escribir:

y <- cars[cars$dist > 20,]
y

xx <- ej1[ej1$Edad < 30,]
View(head(xx,5))

class(ej1$Vivienda)
attributes(ej1$Vivienda)

x2 <- ej1[ej1$Vivienda %in% "Propia",]
View(head(x2,5))

# para obtener lo mismo que con los comandos anteriores. Este método es de 
# alguna forma más directo, aunque tiene la contra que suele amontonar palabras
# y caracteres, resultando en cosas difíciles de leer.

# De todas formas which tiene un argumento extra que es de gran utilidad para 
# trabajar con objetos de más de una dimensión (matrices, data.frames, 
# arrays). Dicho argumento es "arr.ind" y es del tipo lógico. Por ejemplo:

which(cars > 70, arr.ind=TRUE)

# Como se puede ver, el resultado son las filas y columnas de los elementos
# que cumplen con la condición dada.


## Función subset (subconjuntos)

# Para el caso de data.frames, R tiene una función bastante amena para filtrar 
# observaciones siguiendo criterios: "subset"

?subset

# Por ejemplo, para seleccionar las filas de 'cars' tales que dist > 20, uso 
# la sintaxis:

y <- subset(cars, subset=dist > 20)
y

# El argumento 'subset' (sí, el argumento se llama igual que la función,
# espero no sea demasiado confuso) acepta un vector lógico; en este caso una 
# expresión que resulta en un vector lógico.

# A su vez el argumetno 'select' sirve para elegir las columnas de interés:

names(iris)
nrow(iris)
View(head(iris,30))

attributes(iris$Species)

subset(iris, subset=Species == 'versicolor', select=c(Sepal.Length, Petal.Length))

names(ej1)
attributes(ej1$Vivienda)

ej1_propia <- subset(ej1, subset=Vivienda == 'Propia', select=c(Identificacion, Edad))

nrow(ej1_propia)
head(ej1_propia,5)
mean(ej1_propia$Edad)

# En este caso me quedo con las columnas Sepal. y Petal. Length. Nótese que 
# para el nombre de la especie usé las comillas, pero esto no fue necesario 
# para seleccionar las columnas (aunque también funcionaría).
       
# A su vez es de utilidad recordar que muchas otras funciones aceptan un 
# argumento 'subset' para seleccionar las bservaciones que nos interesan. Los 
# dos ejemplos más notables son plot y lm.

# En resumen, subset busca ser más intuitivo y directo que usar which() y/o 
# vectores lógicos en combinación con los corchetes [ ].


      ## Partiendo Tablas (split)
       
       # A veces es necesario partir una tabla según distintas categorías de 
       # observaciones. Es decir, dividir una tabla según los valores de un factor. Por 
       # ejemplo, en la data.frame iris la columna Species es un factor (y obviamente 
       # tiene la misma cantidad de elementos que filas de la data.frame), por lo que 
       # puedo usarlo como criterio de división. Para esto ejecuto:
       
       irisxspp <- split(iris, iris$Species)
       
       # El resultado, irisxspp, es una lista con 3 elementos: data.frames con las 
       # observaciones de iris, pero cada una con el subconjunto de aquellas que 
       # contienen a uno de los niveles del factor iris$Species. Con str se puede 
       # hechar un vistazo:
       
       str(irisxspp)
       
       
       ## Conteos
       
       # Las funciones 'tabulate' y 'table' realizan conteos cada observación, 
       # devolviendo objetos ligeramente diferentes:
       
       (t1 <- tabulate(iris$Species))
       (t2 <- table(iris$Species))
       
       # Mientras que en el primer caso la salida es un vector 'integer', en el 
       # segundo se trata de un objeto de clase 'table', el cual tiene nombres para 
       # sus elementos (en este caso el de las especies de la data.frame iris), de 
       # forma que permite comandos como:
       
       t2['setosa']
       
       # NOTA: esto puede darse para confusiones si las categorías mismas son números
       # enteros, 1, 2, 3, etc... Por ejemplo:
       
       x <- sample(5, 20, replace = TRUE)
       table(x)
       
       # Alternativa: paquete plyr
       # La función 'count' del paquete 'plyr' sirve para hacer conteos por categorías,
       # devolviendo el resultado en un formato diferente (requiere instalar el paquete
       # plyr por supuesto):
       
       # install.packages("plyr") # Si no lo tiene instalado
       library(plyr)
       count(iris$Sepal.Width)
       count(as.vector(iris$Species))
       
       # Nota: el paquete plyr es muy popular para trabajar con datos; no lo veremos
       # en este curso, pero recomendamos que lo explore si considera que le puede 
       # interesar (el siguiente es un link por el cual se puede empezar).
       browseURL("http://plyr.had.co.nz/09-user/")
       
       
       ## Calculos en tablas:
       
       # En R existen algunas funciones útiles que hacen cálculos por columna o fila en 
       # una tabla de datos. Un ejemplo sencillo son las funciones colMeans, 
       # rowMeans, colSums y rowSums (vea la ayuda para entender qué hacen). Pero 
       # para el caso general, el grupo de funciones "apply" es muy práctico.
       
       # (el paquete plyr tiene un conjunto de funciones alternativas a las *apply , 
       # supuestamente más intuitiva)
       
       # Función "apply":
       # Es una función que "aplica" otra función a un conjunto de datos según un
       # cierto criterio (por filas, columnas, etc...).
       # Siguiendo el ejemplo anterior, podemos crear un substituto de colMeans de la
       # siguiente forma:
       
       apply(USArrests, 2, mean)
       
       # Es decir, la salida consiste en el calculo de los promedios para cada 
       # columna de la data.frame USArrests. En este caso el número 2 indica el 
       # "margen" sobre el cual se va ha ejecutar la función, en este caso 'mean' 
       # (nota: margen 1 = filas, margen 2 = columnas; es el mismo "orden de 
       # siempre").
       
       # Veamos cómo funciona, es decir, cuáles son los argumentos
       
       ?apply # Abra la ayuda de la función.
       
       # X:
       # El primer argumento es un "array" (lo que incluye matrices, data.frames, y
       # otros tipos de objetos...).
       # MARGIN:
       # El segundo argumento refiere a los subíndices a los que se aplica la función.
       # Por ejemplo, si vale 1 la función se aplica a todas las filas;
       # si vale 2 se aplica a todas las columnas; si vale c(1, 2) se aplica a filas y
       # columnas (esto en caso de que el objeto "X" tenga más de 2 dimensiones, en
       # una matriz no tendría sentido).
       # FUN:
       # En el tercer argumento es la función en cuestión. En nuestro caso es la
       # función "mean".
       # ...:
       # Este argumento especial indica que se pueden agregar más argumentos según
       # lo que necesite FUN para correr, usando los nombres adecuados (ver más
       # abajo).
       
       # Más ejemplos:
       
       apply(USArrests, 2, mean)   # El promedio de todas las columnas, ya lo vimos
       apply(USArrests, 1, mean)   # El promedio de todas las filas
       
       # El caso del argumento especial "...":
       
       apply(USArrests, 2, quantile, probs=c(0.25, 0.75))
       
       # En este caso FUN es la función quantile y el argumento extra es "probs".
       # Podemos ver que este es un argumento que usa quantile para hacer sus cálculos:
       
       ?quantile
       
       
       ## Variantes de "apply"
       
       # lapply, sapply, vapply y replicate son variantes de la función apply. Estas
       # trabajan de forma ligeramente diferente, pero el objetivo es similar siempre.
       
       # Por ejemplo, lapply trabaja con listas, aplicando la función FUN a todos los
       # elementos de una lista determinada. En este caso no es necesario el 
       # argumento MARGIN. Veamos un ejemplo:
       
       x <- list(a = c(0, 1, 0, 1, 0, 1), b = rnorm(12))
       lapply(x, mean)
       
       # Nótese que la salida es un objeto tipo lista.
       
       # Dado que las data.frames son una especie de lista también, lapply funciona 
       # sin problemas con esta clase de objetos. Por ejemplo:
       
       lapply(USArrests, mean)
       
       # Aquí se obtiene el mismo resultado que con colMeans, pero con una salida del
       # tipo lista...
       
       # La función sapply hace exactamente lo mismo pero devuelve un vector común, 
       # por lo que es más amigable si los resultados son números únicos:
       
       sapply(USArrests, mean)

## Funciones with y within

# Estas funciones sirven para ejecutar comandos "adentro" de una lista... Esto
# es útil ya que permite trabajar con los nombres de las variables
# directamente, en lugar de estar recordando los números de columnas y usando
# llaves todo el tiempo. 

# Los argumentos son:
# data: una lista que sirva para construir un "ambiente" en el cual ejecutar los comandos.
# En este ambiente los objetos existentes son los elementos de la lista
# expr: una expresión, un comando, o varios si se usan las llaves { }.

# Por ejemplo, creo una lista sencilla:
(lista <- list(x=5, y=rnorm(7), z=sample(7)))
# Dentro de esta lista, tengo los elementos x y z. Voy a usar estos valores
# para calcular x * y + z:
(u <- with(lista, x * y + z))

# Nótese que si no uso "with" tengo que escribir lo siguiente:
u <- lista[[1]] * lista[[2]] + lista[[3]]
# o
u <- lista$x * lista$y + lista$z

# Dado que las "data.frame" son listas también, se puede usar with de la misma
# forma. Por ejemplo, con la tabla "iris":
(u <- with(iris, Sepal.Length + Sepal.Width))
# Siempre se usan los nombres correspondientes. Este cálculo equivale a:
iris$Sepal.Length + iris$Sepal.Width

# La ganancia de usar with parece poca en este caso, sin embargo para cálculos
# más complejos las diferencias se vuelven significativas. Una estrategia
# común es usar las llaves { } dentro del mismo paréntesis (en el segundo
# argumento, donde va la expresión). A modo de ejemplo:



# Función within
# La función within devuelve una versión modifiada de la lista de entrada:
iris2 <- within(iris, Sepal.Ratio <- Sepal.Length / Sepal.Width)
head(iris2)
head(iris2,n = 2)
# Se puede ver que existe una nueva columna llamada "Sepal.Ratio". Este tipo
# de operaciones requiere que la nueva variable creada tenga el mismo número
# de observaciones que el resto de la tabla. En lo que refiere a las demás
# reglas de uso, "within" es idéntica a "with".



##---------  Manipulacion Informacion
# lea el archivo en formato txt data.txt
# asigne el archivo de datos a la variable data_txt
setwd(wd1)
list.files()

data_txt <- read.table(file = "data.txt",sep = "\t", dec = ",", header = TRUE)
# que estructura de datos es data_txt
str(data_txt)
View(data_txt)

# Muestre los nombres, clase, dimension, numero de col, numero de filas de data_txt 
data_txt <- datos
names(data_txt)
class(data_txt)
dim(data_txt)
dim(data_txt)[1]
dim(data_txt)[2]
ncol(data_txt)
nrow(data_txt)

summary(data_txt)
# Ingresando a los elementos de la data

#---------------------------- Variable numerica ---------------------
edad <- data_txt[,2]
edad <- data_txt[,"Edad"]
antiguedad<- data_txt[,"Antiguedad"]
length(antiguedad)
typeof(antiguedad)
attributes(antiguedad)
class(antiguedad)
is.atomic(antiguedad)
is.list(antiguedad)
antiguedad[20]
View(antiguedad)
str(edad)
View(edad)
typeof(edad)
length(edad)
attributes(edad)
class(edad)

is.atomic(edad)
is.integer(edad)
is.double(edad)
is.numeric(edad)
is.list(edad)
#####EXTRAER
# obtener los elementos 5, 8, 10 de edad y asignar a edad1
edad1 <- edad[c(5,8,10)]
edad2<-edad[c(20,30)]
edad3<-edad[c(100:200)]
edad3
length(edad1)
edad1

# obtener los 50 primeros elementos de edad y asignar a edad1
edad1 <- edad[1:50]
length(edad1)
# eliminar el primer elemento de edad y asignar a edad1
edad1
edad1 <- edad1[-1]
edad1 <- edad1[-c(5,10,11)]
edad1
length(edad)
length(edad1)
# eliminar los elementos 1, 25, 51 de edad y asignar a edad1
edad1 <- edad[-c(1,25,51)]
length(edad)
length(edad1)
# eliminar los primeros 1000 elementos de edad y asignar a edad1
edad1 <- edad[-(1:1000)]
length(edad)
length(edad1)

# eliminar los elementos iguales a 24 de edad y asignar a edad1
edad==24
edad1 <- edad[edad==24]
# edad1 es constante?
min(edad1)==max(edad1)
length(edad1)
edadis<-edad[edad!=30]
length(edadis)
length(edad[edad!=24])
length(edad[!edad==24])
edad1 <- edad[edad!=24]
length(edad1)
mean(edad1)
min(edad1)
max(edad1)
summary(edad1)

quantile(edad, probs = seq(0.01,0.99,by=0.01))

# Seleccionar los valores inferiores a 65 años asignar a edad1
edad<=65
edad1 <- edad[edad<=65]
length(edad1)
mean(edad1)
min(edad1)
max(edad1)
summary(edad1)

# recodificando valores
# si la edad es superior a 65 setear 65 por defecto
edad>65
edad1 <- edad
edad1[edad1>65] <- 65
max(edad1)
max(edad)
View(edad1)

# si la edad es inferior a 18 setear 18 por defecto
edad1 <- edad
edad1[edad1<18] <- 18
edad1[edad1<18 | edad1>5] <-"fuera de rango"
str(edad1)
min(edad1)
max(edad1)
min(edad)
mean(edad1)
edad2<-as.numeric(edad1)
edad2
mean(edad2,na.rm = TRUE)
View(edad1)
