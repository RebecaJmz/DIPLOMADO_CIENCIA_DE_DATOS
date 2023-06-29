# CLASE 02 JUEVES 23 DE MARZO DE 2023

# INTRODUCCIÓN A RSTUDIO

#LIBRERÍAS
library(stringi)           # Limpieza de texto
library(dplyr)
library(data.table)        # Trabaja volumenes grandes de datos
library(microbenchmark)    #

# Asignar valores a variables mediante el símbolo <-
x <- 5
6 -> y
length(x)                  # Obtener tamaño del objeto

pais <- "Mexico"
nchar(pais)                # Longitud del texto
tolower(pais)              # Convertir a minúsculas
stri_trans_toupper(pais)   # Convertir a mayúsculas


# VECTORES
edad <- c(15,19,13,NA,20)       
deporte <- c(TRUE, TRUE, NA, FALSE, TRUE)
comic_fav <- c(NA, 'SUPERMAN', 'BATMAN', NA, 'BATMAN')


# SELECCIÓN DE ELEMENTOS DEL VECTOR
edad[3]
comic_fav[c(2,5)]
deporte[-3]


# MATRICES
mimatriz <- matrix(data = 1:20, nrow = 4, ncol = 5, byrow = FALSE)
mimatriz
mimatriz[3,4]              # Recordar notación de matrices matriz[renglón, columna]
mimatriz[,5]               # Para seleccionar una columna solo se coloca el segundo elemento
mimatriz[,5, drop = FALSE] # Mantiene la notación de matriz
mimatriz[-1,-3]            # Signo menos para eliminar elementos


# ARRAYS
miarray <- array(data = letters[1:24], dim = c(3,4,2)) 
miarray
miarray[,3,]


# DATA FRAME
mimarco <- data.frame(edad, deporte, comic_fav)
str(mimarco)              # Composición del objeto
mimarco$edad              # Utilizar el signo de $ para acceder
mimarco[,"edad"]
mimarco[["edad"]]
mimarco$deporte == mimarco[,"deporte"]

# Selección de datos
subset(mimarco, subset = deporte == TRUE)
subset(mimarco, subset = edad >= 17)
subset(mimarco, subset = edad < 20, select = c('deporte', 'comic_fav') )


# LISTAS
set.seed(12345)
mivector <- runif(n = 5)
 matriz2 <- matrix(data = 1:12, ncol = 6)
 milista <- list(E1 = mivector, E2 = matriz2, E3 = mimarco) 

 
 # FUNCIONES
 test <- function(x){
                     if(!is.numeric(x))
                       
                       return(0)
                       
                       return(2*x)
                    }
 
test(x)
test(comic_fav) 
 
# Se detiene si el vector recibido no es numérico
test2 <- function(x){
                     stopifnot(is.numeric(x))
    
                     return(x)
  
                    }

test2(x)
test2(comic_fav) 

# Operador global
x <- 3
modify <- function(x){
                      x <<- 2 
                      return(x)
                     }

modify(x)
x


# OPERACIONES
a <- c(1,2,3)
b <- c(5,10,15)
a + b                     # La suma de dos vectores
a < b                     # Comparación de valores
min(b)                    # Devuelve el elemento más pequeño
max(b)                    # Devuelve el valor mayor
length(b)                 # Devuelve la longitud del objeto
b[length(b)]              # Devuelve el último elemento
range(b)                  # Nos muestra el valor mínimo y máximo
sum(b)                    # Devuelve la suma total de los elementos
prod(b)                   # Devuelve el resultado de la multiplicación de los elementos
which.min(b)              # Devuelve la posición del mínimo
which.max(b)              # Devuelve la posición del máximo
rev(b)                    # Cambia el orden de los elementos
rep(1,5)                  # Repite el primer elemento, un total de veces igual al segundo
seq(1,5)                  # Crea una secuencia con los valores de inicio y fin


#MICROBENCHMARK
microbenchmark(
               suma_vect = a+b, 
                suma_for = {
                            c <- NULL
                            for( i in 1:length(a))
                               
                            c <- c(c, a[i]+b[i])
                           },
  
                              times = 100
              )


# INSTRUCCIONES DE CONTROL Y CICLOS
x <- 1
if(x == 0){
           print("Es cero")
          
          }else{
                
                 print("No es cero")
                }

# FOR
for( i in 1:length(a)){
  
                        print(a[i]+b[i])
                      
                      }
 
# WHILE
contador <- 1
while (contador < 5) {
                     print(contador)
                     contador <- contador + 1
                    }

while (TRUE) {
              print(Sys.time())
              Sys.sleep(5)
             }
