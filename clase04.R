########################################################################################
#############################        CURSO R- BÁSICO       ############################# 
#############################          Clase 4             ############################# 
######################################################################################## 
#En R la clase 'list' (o lista para nosotros) tiene
# una estructura que supera la  limitación de datos de 
# un mismo tipo.. 

## Listas

# Una lista puede pensarse como un vector que contiene varios objetos, donde 
# cada objeto puede ser de un tipo/clase diferente. Además los componentes de la
# lista no tienen por qué tener la misma cantidad de elementos. Con la función 
# list podemos crear una lista de cero; por ejemplo:
x <- list(c('pepe','juan','pedro' ), 1:20)
# En este caso, x contiene a un vector "character" y otro "numeric"; el primero 
# tiene 3 elementos, mientas que el segundo tiene 20:
x

# Para acceder al contenido de **cada elemento** de una lista se utilizan los 
# índices entre corchetes dobles. Así, vamos a explorar qué tiene nuestra lista
# 'x' en su primer elemento:
x[[1]]
# [1] "pepe"  "juan"  "pedro"
class(x[[1]])  # "character"
length(x[[1]]) # 3

# y en el segundo: 
x[[2]]
# [1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20
class(x[[2]])  # "integer"
length(x[[2]]) # 20

######################################################################################## 
# Crear una lista de la siguiente forma (lista1)
## 5 números doubles
## 3 números enteros
## 4 nombres de personas

lista1 <- list(c(1.2,3.6,4.0,7.1,0.5), c(1:3), c("pepe" , "juan" , "pedro" , "pablo"))

######################################################################################## 



# Nótese que para llamar a varios elementos dentro de una lista hay que usar 
# corchetes simples, como en el siguiente ejemplo:
x[1:2]
# En este caso tiene poca gracia hacerlo, pero si se tratara de listas más 
# grandes puede ser de utilidad este conocimiento.

# Esta misma información la podemos obtener usando la función str, aunque
# presentada en una forma diferente (más compacta):
str(x)
#####función str()

######################################################################################## 
# Realizar lo siguiente (con la lista1)
## acceder al tercer elemento
## obtener la estructura de la lista
## llamar a los primeros 3 elementos

lista1[[1]][3]
str(lista1)
lista1[[1]][1:3]

######################################################################################## 

## Listas nombradas

# Hasta ahora los ejemplos creados en esta sesión han sido de listas sumamente 
# simples y carentes de nombres. Pero para facilitar la interacción con el 
# usuario, las listas pueden tener nombres para sus objetos. En el caso de x 
# aún no hemos puesto nombres, lo cual lo podemos corroborar con la función 
# names:
names(x)

# Es fácil asignar nombres antes y después de crear una lista. En el primer 
# caso, al usar la función list podemos cambiar ligeramente la sintaxis para 
# asignarle los nombres 'jose' y 'carlos' a los elementos de x, de la 
# siguiente manera:
(x <- list(nombres = c('pepe','juan','pedro'), numeros = 1:20))
######################################################################################## 
# Realizar lo siguiente 
## Crear una lista (lista 2)
## asignando  nombres a los objetos de la lista 2
## obtener la estructura de la lista 2

lista2 <- list(decimales=c(1.2,3.6,4.0,7.1,0.5), enteros=c(1:3), nombres=c("pepe" , "juan" , "pedro" , "pablo"))
lista2
str(lista2)

######################################################################################## 

# Con el segundo método podemos hacer los siguientes pasos para darle nombres 
# a la lista, empezando por un objeto nulo:
x <- NULL
# Lo siguiente es simplemente agregar los nuevos objetos usando el 
##       operador $:
x$nombres <- c('pepe','juan','pedro')
x$numeros <- 1:20
######################################################################################## 
# Crear una lista de la siguiente forma (lista3)
# asignadi los nombres a cada objeto.
## 7 números enteros
## 5 nombres de personas
## 4 nombres de ciudades

lista3 <- NULL
lista3$enteros <- 1:7
lista3$personas <- c("ana", "maria", "rosa", "juan", "pedro")
lista3$ciudades <- c("quito", "roma", "toronto", "cali")
str(lista3)

######################################################################################## 


# Ahora que los elementos de x están nombrados, podemos usar el operador $ 
# para referirnos a ellos usando dichos nombres. Veamos:
x$nombres
x$numeros

# Nótese que estos dos componentes de la lista son objetos en sí mismos y se 
# pueden usar como tal (en este caso, como vectores) en cualquier comando de 
# R. Por ejemplo, si queremos el 7mo. elemento de x$carlos, podemos usar:
x$numeros[7]

# Por último, si queremos modificar estos nombres, la función names nos sirve 
# de vuelta. Si queremos cambiar sólo uno, el primero por ejemplo, usamos los
# corchetes:
names(x)[1] <- 'personas'
names(x)[2] <- 'datos'

str(x)

# O podemos cambiar los dos al mismo tiempo:
names(x) <- c('nombre del objeto 1', 'nombre del objeto 2')
str(x)
######################################################################################## 
# Cambiar los nombres de los objetos de la lista3
# Cambiar el nombre únicamente  al segundo objeto  de la lista 3

names(lista3)[2] <- 'nombres'
str(lista3)

######################################################################################## 


# Como dijimos, las listas son útiles para agrupar varios tipos de datos en un
# sólo objeto, ya que es una clase de objeto no tan restrictiva como las matri-
# ces o los vectores normales.



######################################################################################## 
######################################################################################## 
## Matrices
######################################################################################## 

# Habiendo visto vectores, que son arreglos de objetos en una dimensión, en
# esta sección veremos un tipo de objeto, las matrices, que son arreglos en dos
# dimensiones. Como tales, estos objetos tienen una altura (cantidad de filas) y
# un ancho (cantidad de columnas)(y en general siempre se listan en ese orden).

# Una manera bastante elemental de crear una matriz, es utilizando la función
# matrix, como en el siguiente ejemplo:
m <- matrix(0, nrow = 3, ncol = 3)

# El primer argumento es el o los valores con los que "llenaremos" la matriz.
# El segundo y tercer argumentos de la función son respectivamente la cantidad
# de filas y columnas que tendrá. En este caso es una matriz cuadrada de
# ceros, la cual se muestra en R con este formato, del cual vamos a comentar
# más adelante:
m
#      [,1] [,2] [,3]
# [1,]    0    0    0
# [2,]    0    0    0
# [3,]    0    0    0

# En este caso el "relleno" de la matriz es un número único, pero a veces
# podemos usar vectores, es decir una cantidad de n elementos que van a ocupar
# las posiciones de la matriz. Por ejemplo:
m <- matrix(1:9, nrow = 3)
# En este caso, llenaremos la matriz con una secuencia de 1 a 9 (el número de
# columnas lo "deduce" R a partir del número total de elementos  de filas).
# No es trivial considerar el órden en que se van llenando las posiciones de
# la música. Por defecto este orden es por columnas; se empieza por la primer
# columna y se sigue por la segunda y así sucesivamente.
m
#      [,1] [,2] [,3]
# [1,]    1    4    7
# [2,]    2    5    8
# [3,]    3    6    9

# Si se desea se puede cambiar esta forma de rellenado con el argumento byrow,
# de la forma en que sigue:
m <- matrix(1:9, nrow = 3, byrow = TRUE)

# El argumento "byrow" (del tipo "lógico") sirve para especificar si la matriz
# debe llenarse por filas. 
# Por defecto su valor es FALSE, llenándose por
# columnas, como en el caso anterior.
m
#      [,1] [,2] [,3]
# [1,]    1    2    3
# [2,]    4    5    6
# [3,]    7    8    9
######################################################################################## 
# Crear una matriz (matriz1)
## con una secuencia de 1:20
## el número de filas 5
## el llenado por filas
# Crear una matriz (matriz2)
## con una secuencia de 1:30
## el número de filas 6
## el llenado por columnas

matriz1 <- matrix(0, nrow = 5)
matriz1 <- matrix(1:20, nrow = 5)
matriz1

matriz2 <- matrix(0, nrow = 6)
matriz1 <- matrix(1:30, nrow = 6, byrow = TRUE)
matriz1

######################################################################################## 



# Otra forma común de crear o modificar matrices es utilizando las funciones
# rbind y cbind. Estas funciones sirven para "pegar" vectores o matrices. 

#Con  cbind se "pegan columnas", como en el siguiente ejemplo:
u <- 1:5
v <- 11:15
matrizc<-cbind(u, v);matrizc
# Este es el caso mínimo, ya que se pueden pegar n vectores del mismo largo
# usando la misma sintaxis. En cambio la función rbind sirve para "pegar filas":
matrizr<-rbind(u, v);matrizr
# En caso de que u y v sean matrices también pueden usarse estas funciones,
# pero hay que tener en cuenta el tamaño de las mismas. Es decir, si usamos
# cbind para pegar dos (o más) matrices, entonces estas tienen que tener la
# misma cantidad de filas. A la inversa rbind funciona cuando las matrices
# tienen la misma cantidad de columnas. Veamos un ejemplo de cada caso:
m0 <- matrix(0, 3, 3)
m1 <- matrix(1, 3, 3)
cbind(m0, m1)
rbind(m0, m1)
######################################################################################## 
# Crear 2 matrices (m1,m2)
## de tamaño 4*4
## la primera (m1) con una secuencia de números
## la segunda (m2) todos sus elementos son 5
##  pegar las dos matrices por columnas (una nueva matriz m3)

m1 <- matrix(0, nrow = 4, ncol = 4)
m1 <- matrix(1:16, nrow = 4)
m1
m2 <- matrix(5, nrow = 4, ncol = 4)
m2
m3 <- cbind(m1, m2)
m3

######################################################################################## 
## Índices de las matrices

# Al tener dos dimensiones, tenemos que dar 2 índices, primero filas, luego
# columnas. Las reglas son las mismas que en los vectores, veamos ejemplos:
x <- matrix(1:20, 4, 5) # Creamos una matriz...
x
# Para obtener el elemento de x ubicado en la fila 2 y columna 3:
x[2, 3] # [1] 10

# Ahora, para tomar varios elementos de x, abarcando varias filas y columnas:
x[2:4, 3:5]
#      [,1] [,2] [,3]
# [1,]   10   14   18
# [2,]   11   15   19
# [3,]   12   16   20

# Al igual que con vectores, la flecha de asignación sirve para modificar
# valores de las matrices:

x[2, 1] <- -100 # El elemento de la fila 2 y la columnas 1 ahora 
# tiene el valor de -100
x

x[2, 2:4] <- -1 # Los elementos de la fila 2 y las columnas 2, 3 y 4 ahora
# tienen valor -1
x
#      [,1] [,2] [,3] [,4] [,5]
# [1,]    1    5    9   13   17
# [2,]    2   -1   -1   -1   18
# [3,]    3    7   11   15   19
# [4,]    4    8   12   16   20

# En definitiva, se siguen los mismos criterios que ya vimos para vectores,
# con la diferencia de que hay que tener en cuenta las dos dimensiones (filas
# y columnas).

# Al dejar un lugar vacío, por defecto toma todos los valores posibles de
# filas o columnas según el caso. Por ejemplo, para ver la fila 1 completa, se
# debe dejar vacío el lugar de las columnas:
x[1,]    # La fila 1

# En cambio si se quiere ver una columna completa, se deja vacío el primer
# lugar, por ejemplo:
x[, 3:4] # Devuelve las columnas 3 y 4

# Nótese que este uso de los índices es el que se usa al momento de imprimir
# la matriz en la consola.

######################################################################################## 
# Modificar los elementos de m3 de la siguiente manera
## los elementos de la fila 1 sean todos iguales a 200
##el elemento de la fila 3 y la columna 5 sea igual a 0.0005
#Acceder a toda la fila 2
# Acceder a toda la columna 3

m3[1,] <- 200
m3[3,5] <- 0.0005
m3
m3[2,]
m3[,3]

######################################################################################## 
# Muchas veces es necesario saber las dimensiones (cantidad de filas y
# columnas) de las matrices. Para esto se pueden usar las funciones dim, nrow
# y ncol:
dim(x)
nrow(x)
ncol(x)
# Para ejecutar el producto matricial no se usa el operador normal *, hay que
# usar un operador especial, %*%. De otra forma, en vez de hacer esta operación
# R simplemente realiza una multiplicación "elemento por elemento", como ocurre
# para los vectores. Por ejemplo:
x <- matrix(1:25, 5, 5)
x
# Veamos una comparación de resultados:
x * x
x %*% x

# La matriz transpuesta (intercambiar los x[i, j] por x[j, i]) se puede
# obtener con la función t:
t(x)


# R cuenta también con una función nativa para calcular determinantes de
# matrices cuadradas, llamada "det" o "determinant":
det(x) # o
determinant(x)

# Hay algunas funciones hechas para trabajar con matrices (o data.frames)
# específicamente:
colMeans(x) # Promedios de las columnas
rowMeans(x) # y de las filas
colSums(x)  # Sumatoria de las columnas
rowSums(x)  # y de las filas

## Resumen:

# Las matrices son estructuras para guardar información que siguen a los
# vectores en complejidad al tener 2 dimensiones. Comparten muchas cosas con
# los vectores: todos los elementos deben ser del mismo tipo, las operaciones
# trabajan de manera similar, etc. Sin embargo no siempre son la clase de
# objeto ideal para trabajar con datos, especialmente si tenemos tablas de
# datos con información de tipos dispares, tales como nombres o números. Para
# esto existen los objetos "data.frame" y las listas, los que vamos a cubrir
# en la siguiente lección.
