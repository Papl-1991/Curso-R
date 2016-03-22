########################################################################################
#############################        CURSO R- BÁSICO       ############################# 
#############################          Clase 5             ############################# 
######################################################################################## 
## Matrices extra
######################################################################################## 

# A propósito, un método parecido de crear matrices es tomando un vector y 
# modificar su atributo de dimensiones, de la siguiente manera:
x <- 1:20         # Crea un vector con una secuencia de 1 a 20
dim(x) <- c(4, 5) # Al vector creado le adjudicamos dimensiones: número de 
# filas y columnas.
x


## Operaciones con vectores

# Cuando se multiplican vectores por matrices, utilizando el operador normal 
# *, hay que tener precauciones respecto los tamaños de los objetos, ya que si 
# no corremos el iesgo de caer en errores. En todo caso, lo que R hace es 
# simplemente considerar a la matriz como un vector y hacer la operación 
# elemento por elemento (yendo por las columnas), reciclando los valores del 
# vector original para parear todos los elementos de la matriz:
x <- matrix(1:20, 4, 5)
x * c(-1, 0, 1, 0, -1)
x + c(-100, 0)
# En general no es recomendable recurrir a este tipo de operaciones a menos
# que sea absolutamente necesario.

######################################################################################## 
###               La clase data.frame                                                ###
######################################################################################## 

# La clase "data.frame" es un tipo particular de lista, en la que todos los 
# objetos tienen la misma cantidad de elementos, pero mantienen la libertad de 
# pertenecer a distintas clases. Es básicamente una tabla de datos, en donde 
# las filas son casos y las columnas variables. De hecho, vamos a llamar 
# "columnas" o "variables" indistintamente para referirnos a las columnas de un
# data.frame.

## ¿Cómo crear data.frame?

# Para crear data.frames de cero la función data.frame es una opción de uso 
# frecuente, la cual funciona de forma muy similar a list. Veamos un ejemplo:
dd <- data.frame(1:10, seq(.1, 1, by=.1))
names(dd)<-c("enteros","decimales")
dd

d <- data.frame(enteros=1:10, decimales=seq(.1, 1, by=.1))
d
#     enteros decimales
#1        1       0.1
#2        2       0.2
#3        3       0.3
#4        4       0.4
#5        5       0.5
#6        6       0.6
#7        7       0.7
#8        8       0.8
#9        9       0.9
#10      10       1.0
# El resultado es una tabla con dos columnas llamadas "enteros" y "decimales". 

# Nótese que estos son dos vectores de clases diferentes:
head(d) # La función head devuelve los primeros elementos
tail(d) # La función tail devuelve los últimos elementos
class(d)
class(d$enteros)
class(d$decimales)

# Nótese también que el uso del operador $ es idéntico al caso de las 
# listas. Una característica de las data.frame que las diferencia de las 
# matrices es que necesariamente deben tener las columnas nombradas. Nótese 
# que tanto en matrices como en data.frames las columnas se pueden nombrar 
# usando colnames (equivalente a names si se trata de un data.frame) y que las 
# filas también se pueden nombrar, usando rownames.

# Las funciones genéricas str y summary son opciones muy útiles para ver la 
# data.frame de forma resumida:
str(d)
summary(d)
View(d)

######################################################################################## 
#Crear un data frame con el nombre data1 con 4 variables y 10 datos
###1era variable de tipo double
###2da variable de tipo character
###3era variable de tipo integer
###4ta variable de tipo lógico
### cada objeto con su respectivo nombre
## Analizar la esrtuctura del dataframe (str & summary)

data1 <- data.frame(primera=c(1.5,2.5,3.5,4.5,5.5,6.5,7.5,8.5,9.5,10.5), segunda=c("ab","ba","ca","ad","ea","fa","ga","ha","ai","ja"), tercera=1:10 , cuarta=c(T,F,T,F,T,T,F,F,T,T))
str(data1)
summary(data1)

######################################################################################## 

# Adicionalmente, es bastante común transformar matrices (objetos de la clase 
# "matrix") en data.frames, utilizando el coercionador as.data.frame de la 
# siguiente manera:
m <- matrix(1:25, 5, 5)
as.data.frame(m) 

# De todas maneras, tal vez la forma más común de incorporar una data.frame a 
# una sesión de R es importando una tabla de datos, ya que al hacerlo 
# (usualmente con las funciones read.table o read.csv) R devuelve objetos de 
# esta clase.

# Para mostrar los ejemplos de esta lección nos basaremos en algunas tablas de 
# datos que ya vienen incluidas en el R básico (específicamente en el paquete 
# 'datasets'). Las data.frames "cars" e "iris" son las que usaremos aquí 
# particularmente.

View(cars)
View(iris)
summary(cars)
str(iris)

d <- cars
d$speed[1:20]

## Índices y data.frames

# En muchos sentidos un data.frame se comporta en forma similar a un objeto de
# clase "matrix". En particular, la forma de usar los índices es 
# prácticamente idéntica: hay que especificar filas y columnas (y en ese orden).
# Por ejemplo:
iris[1,]
iris[2, 5]

# También sirven las funciones cbind y rbind, para pegar nuevos elementos, por 
# columnas o filas respectivamente. Por ejemplo, sabiendo que iris tiene 150 
# filas (lo que se puede averiguar con nrow o dim), puedo agregarle una nueva 
# variable llamada "nuevaCol" con cbind de la manera siguiente:


x <- cbind(iris, nuevaCol=1:150)
head(x)
# Nótese cómo se nombró la nueva columna en el momento de agregarla.

carstiempo <- cbind(cars, tiempo=1:50)
carstiempo

######################################################################################## 
#crar una nueva data que es:
#la data1  agregada dos nuevas variables(vectores columnas) sin ningún nombre
# y despuués cambiar el nombre a v1 & v2 respectivamente
# obtener los últimos valores de la nueva data


data2 <- cbind(data1, seq(10,46,4), c(1,1,1,1,1,1,1,1,1,1))
names(data2)[5] <- "quinta"
names(data2)[6] <- "sexta"
data2
tail(data2)

######################################################################################## 

# Es entonces importante recordar que más allá de similitudes, matrices y 
# data.frames *no* son la misma cosa.

# Resumen:
# Las listas y los data.frames son dos estructuras muy convenientes para
# trabajar con datos. Su complejidad no es significativamente mayor al de las
# matrices y sin embargo tienen diferencias que van a probar ser cruciales para
# facilitar un diálogo fluido en análisis estadísticos y el trabajo con datos.


# Al igual que con las listas comunes, el operador $ sirve para llamar las
# variables por sus nombres, en el caso de que los tengan:
cars$speed
iris$Petal.Length

# Y al igual que en las listas también se puede usar los números entre corche-
# tes dobles:
cars[[1]]
iris[[3]]

######################################################################################## 
#acceder a la variable v1 (de dos maneras diferentes)
# guardar en una nueva variable la variable v2
# ver solamnete los primeros 5 valores de la variable v1
######################################################################################## 

class(cars$speed) # "numeric"

# Aunque no todo está permitido ...
rbind(cars, matrix(0, 4, 2)) # El problema está en la diferencia de nombres.


# Los atributos y las clases de los objetos son frecuentes causantes de errores
# y confusiones. Existen objetos que tienen atributos de varias clases, ya que
# hay clases que heredan y/o comparten atributos con otras.
# Un caso clarísimo es la clase "data.frame", la cual tiene varias facilidades
# para trabajar con datos que la hacen superior a la clase "matrix" para dichas
# tareas, a pesar de que tienen muchas cosas en común.
# Una consecuencia de esta similitud es que muchas operaciones con matrices son
# iguales con data.frames:
datos  <- data.frame(x=rnorm(6), y=rnorm(6, mean=3))
matriz <- as.matrix(datos) 
datos[1,2] == matriz[1,2]        # Usan el mismo sistema de índices
cbind(datos, rnorm(6, mean=10))  # Funcionan igual con cbind y rbind
cbind(matriz, rnorm(6, mean=10))


######################################################################################## 
## Factores
######################################################################################## 
# Los objetos de clase "factor" son objetos que sirven para trabajar con varia-
# bles categóricas, como pueden ser franjas etarias, nombres de especies o
# lugares. Una forma de comprender el concepto de factor es pensando en su uso
# dentro del diseño experimental: un factor es una variable cuyo efecto se busca
# entender; en un experimento se crean distintos tratamientos, cada uno con un
# nivel determinado para dicho factor. Estos tratamientos equivalen al concepto
# de niveles o "levels" utilizado en los objetos "factor" de R.

# Ejemplo: efecto del nitrógeno en el crecimiento de un cultivo. Un
# tratamiento puede ser sin N y otro con N. Entonces tenemos un factor ("N")
# con dos niveles (que pueden ser denominados 0 y 1, o de cualquier otra
# forma).
# Creación de un factor si se dispone de un vector integer
vec <- c(1, 2, 2, 1, 2, 1, 2)
vec
fac <- factor(vec, levels=c(1,2), labels = c("Femenino", "Masculino"))
fac
# Observamos que fac asiganamos la etiqueta Femenino a los datos iguales a 1
# y Masculino a los datos igales a 2

# levels= c(    1     ,     2   )
#labels = c("Femenino", "Masculino")

# Creación de un factor si se dispone de un vector character
vec <- c("Femenino","Masculino","Masculino","Femenino","Masculino",
         "Femenino","Masculino")
vec
fac <- factor(vec, levels= c("Femenino", "Masculino"), labels=c(1, 0))
fac
class(fac)
# Observamos que fac asiganamos la etiqueta 1 a los datos iguales a Femenino y
# 0  a los datos igales a Masculino


# por defecto labels = levels, si no se setea el valor labels= se toma el 
#valor por default
fac <- factor(vec, levels= c("Femenino", "Masculino"))
fac
# Es decir si no se pone la etiqueta los datos originales se mantienen
######################################################################################## 
## Dado el vector vec1 <-c(1,3,1,2,2,3 2, 2,1,2,3 1,3,1,2,1, 2, 1,3,3 2,1)
## Crear un factor con el nombre fact1 en el cual
### Se le asigne la etiqueta "Pronto pago" a los datos iguales a 1
### Se le asigne la etiqueta "pago a tiempo" a los datos iguales a 2
### Se le asigne la etiqueta "deuda" a los datos iguales a 3

vec1 <- c(1, 3, 1, 2, 2, 3, 2, 2, 1, 2, 3, 1, 3, 1, 2, 1, 2, 1, 3, 3, 2, 1)
fact1 <- factor(vec1, levels=c(1, 2, 3), labels=c("Pronto pago", "Pago a tiempo", "Deuda"))
fact1

######################################################################################## 

# Para obtener los atributos de un factor utilizamos attributes().
vec <- c(1, 2, 2, 1, 2, 1, 2)
fac <- factor(vec, levels=c(1,2), labels = c("Femenino", "Masculino"))
attributes(fac)

# Para realizar conteos por categoría, se utiliza la función table().
# tabla de frecuencias
table(fac)
# tabla de porcentaje porcentaje
prop.table(table(fac))
######################################################################################## 
# Obtener la tabla de frecuencias y porcentaje de fact1
# Crear un factor propio. y analizar su tabla de frecuencias
######################################################################################## 



######################################################################################## 
## Importar  datos en R
######################################################################################## 

# La edición de datos desde R puede resultar difícil, en comparación con
# las hojas de cálculo, debido a que no presenta las mismas facilidades de
# visualización de tablas de datos que éstas.  Si bien es posible, como
# ya hemos visto, editar datos como objetos de R (e.g. vectores, matrices,
# data.frames), es relevante sobre este punto aprender a importar datos desde,
# por ejemplo, hojas de cálculo.

# En caso de no utilizar planillas de cálculo u otros programas para analizar 
# los datos, es más recomendable y simple utilizar las funciones save y load 
# para guardar y cargar objetos de nuestra área de trabajo (ver también 
# saveRDS y readRDS).


## Importar datos desde archivos de texto plano

# La opción más rápida y funcional es importar y exportar datos directamente
# desde R. Los archivos de texto plano, tales como los txt o csv, son la opción
# más sencilla para importar datos desde hojas de cálculo. Desde cualquier 
# programa de hojas de cálculo se pueden guardar planillas con estos formatos. 

# Por ejemplo, Excel permite guardar e importar archivos .txt (i.e. texto 
# delimitado por tabulaciones) o .csv (i.e. texto delimitado por comas). 
# Estos archivos, habiendo sido guardados desde Excel, pueden ser leídos desde 
# R, mediante la función 'read.table'.

# Paso previo...
# Antes de importar cualquier tipo de archivo que contenga nuestros datos, 
# debemos conocer el directorio de trabajo en donde estamos trabajando y el 
# directorio de trabajo en donde se encuentran nuestros datos.
# Esto es muy importante a tener en cuenta, dado que muchas veces R trabaja en
# una carpeta por defecto y nuestros datos suelen encontrarse en otras carpetas
# Para resolver estas cuestiones recuerde que existen las funciones 'getwd()' y 
# 'setwd()' (así como opciones de menú en RStudio). La primera nos dice en que 
# directorio de trabajo nos encontramos actualmente y la segunda nos permite
# cambiar dicho directorio.

# Una vez que nos hallamos en la carpeta en donde se encuentran nuestros
# archivos de datos, estamos prontos para importar los mismos al R.

# Para comprender como es que funciona read.table los datos realizaremos un 
# ejemplo. Habiendo descargado el archivo "ejemplo.txt", de esta unidad al 
# directorio de trabajo actual de R, ejecutar:
read.table(file = "ejemplo1.txt", header = TRUE, sep = "\t", dec = ".")

# Es importante entender los argumentos de la función 'read.table', los cuales 
# veremos ahora:
# file: es el nombre del archivo que queremos importar. Tenga en cuenta que
#   este debe tener la extensión del archivo, en este caso es un txt. Nótese que 
#   dicho nombre debe ser escrito entre comillas.
# header: es un argumento lógico que cuando es TRUE, como en este caso, nos
#   indica que el nombre de las variables (columnas) está en nuestro archivo de 
#   calculo original, que deben tenerse en cuenta y no forman parte de las
#   filas de la tabla importada (juegue con el argumento cambiando ahora su 
#   valor a FALSE).
# sep: es el argumento que indica como hemos separado los distintos caracteres
#   (columnas) en nuestro archivo de texto. Dependiendo de que formato hayamos
#   elegido para guardarlo será el valor correcto que debemos utilizar para que
#   R reconozca en donde comienza y termina una columna. En el caso de los 
#   archivos txt los separadores suelen ser tabulaciones o incluso espacios en 
#   blanco de ancho variable (siendo esta última la opción por defecto de 
#   read.table). Para especificar la tabulación como separación se utiliza el
#   simbolo '\t', como se puede observar en el ejemplo. Otra forma de guardar un
#   archivo de cálculo es formato csv. En este caso el separador suele ser la
#   coma ',' o el punto y coma ';' (siendo el primer caso lo normal para una 
#   PC configurada para trabajar en inglés, en la que los decimales no se 
#   indican con comas, si no con puntos; el segundo caso es el normal para 
#   programas en español).
#   Nótese la extensión .txt o .csv es sólo un rótulo y no determina de por sí
#   cuál es el separador de campos (i.e.: un .txt puede usar comas para separar
#   campos, a pesar de ir contra la convención).
# dec: es el argumento que indica el símbolo de los decimales de los números 
#   en nuestro archivo de texto. La opción más adecuada depende de la 
#   configuración de idioma del programa con el que se creó el archivo de 
#   texto a importar. Nótese que en el caso de archivos csv pueden darse 
#   confusiones entre separadores de columnas y decimales, por lo que hay que 
#   estar atento a estos detalles.


# Existen otros argumentos en la función 'read.table' como row.names (para
# ponerle nombre a las filas), col.names (para ponerle nombres a las columnas
# si es que nuestra base de datos original no presentaban) y más... para 
# conocer estos argumentos utilice la ayuda o la función args:
?read.table
args(read.table)

# "read.table" importa los datos a un objeto de clase 'dataframe', con las
# mismas propiedades de cualquier objeto de esta clase. Para mantener el
# objeto en el área de trabajo hay que asignarlo:
ej1 <- read.table(file = "data.txt", header = TRUE, sep = "\t", dec = ".")
head(ej1)
# Ahora importaremos un archivo pero en formato csv. En principio la única 
# diferencia es que el separador es un punto y coma generalmente (si 
# trabajamos con programas de planilla de cálculo en español). Habiendo
# descargado el archivo "ejemplo2.csv" al directorio de trabajo de R,
# se puede ejecutar:
ej2  <- read.table(file = "data_read.csv",sep = ",", dec = ".", header = TRUE)
head(ej2)

# Nonta: es posible que el valor de dec deba ser "," en lugar de "."

# Observe que 'ej2' es igual al archivo importado en formato txt 'ej1',
# pero algunos de los argumentos cambian, por lo cuale debe ser cuidadoso y
# prolijo a la hora de elejir.

ej3 <- read.csv(file = "data.csv")
head(ej3)
# archivo formato xlsx
install.packages("readxl", dependencies = TRUE)
library(readxl)
#funciones del paquete
ls("package:readxl")
#sheet= el numero de hoja o el nombre de la hoja
# na=" " considera el espacio como dato perdido
#col_names similar al header de read.table
ej4 <- read_excel("data.xlsx",sheet = "datos",col_names = TRUE, na=c(""))
head(ej4)
# archivos spss formato .sav
install.packages("foreign", dependencies = TRUE)
library(foreign)
ls("package:foreign")
data_sav1 <- read.spss("data_read.sav", use.value.labels = TRUE, 
                       to.data.frame = TRUE)
install.packages("haven", dependencies = TRUE)
# spss: read_spss(), sas: read_sas(), stata: read_dta()
library(haven)
ls("package:haven")
data_sav2 <- read_spss("data_read.sav")
#####################################################################################
# Leer todos los demás archivos dentro de la carpeta
#####################################################################################
