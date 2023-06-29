##TAREA 01 EJERCICIOS DEL MANUAL DE R

#CAPITULO 2
# 1. Construya un vector con la primeras 20 letras MAYÚSCULAS usando la función LETTERS.

a <- LETTERS[1:20]
a

# 2. Construya una matriz de 10 × 10 con los primeros 100 números positivos pares.

b <- 2*c(1:100)
c <- matrix(b, nrow = 10, ncol = 10 )
c

# 3. Construya una matriz identidad de dimension 3 × 3. Recuerde que una matriz identidad 
#    tiene sólo unos en la diagonal principal y los demás elementos son cero

id3 <- diag(c(1,1,1))
id3

# 4. Construya una lista con los anteriores tres objetos creados.

lista1 <- list("letras"= a, "matriz"=c, "ide"= id3)
lista1

# 5. Construya un marco de datos o data frame con las respuestas de 3 personas a las preguntas: 

#(a) ¿Cuál es su edad en años? 

años <- c(30,29,26)

#(b) ¿Tipo de música que más le gusta? 

music <- c("k-pop","reggaeton","metal")

#(c) ¿Tiene usted pareja sentimental estable?

estado <- c("NO","SI","NO")


marco <- data.frame("edad" = años, "musica" = music, "pareja" = estado)
marco

# 6. ¿Cuál es el error al correr el siguiente código? ¿A qué se debe?

edad <- c(15, 19, 13, NA, 20)
deporte <- c(TRUE, TRUE, NA, FALSE, TRUE)
comic_fav <- c(NA, 'Superman', 'Batman', NA, 'Batman')
matrix(edad, deporte, comic_fav)

# El error se debe a la naturaleza de los datos, debido que dentro de las matrices los
# elementos deben ser homogéneos.



#CAPITULO 5

# 1. ¿Qué cantidad de dinero sobra al repartir $10000 entre 3 personas?

10000%%3

# 2. ¿Es el número 4560 divisible por 3?

4560%%3==0

# 3. Construya un vector con los números enteros del 2 al 87. ¿Cuáles de esos números son divisibles por 7?

k<- c(2:87)
k <- k[k%%7==0]
k

k <- c(2:87)[c(2:87)%%7==0]
k

# 4. Construya dos vectores, el primero con los números enteros desde 7 hasta 3, el segundo vector con los 
#    primeros cinco números positivos divisibles por 5. Sea A la condición de ser par en el primer vector. 
#    Sea B la condición de ser mayor que 10 en el segundo vector. ¿En cuál de las 5 posiciones se cumple A 
#    y B simultáneamente?

l <- 7:3
p <- seq(from = 5, by=5, length.out = 5)

l%%2==0 & p>10


# 5. Consulte este enlace en el cual hay una anéctoda de Gauss niño. Use R para obtener el resultado de la 
#    suma solicitada por el profesor del niño Gauss.

suma_G <- sum(1:100)
suma_G

# 6. Construya un vector con los siguientes elementos: 1, -4, 5, 9, -4. Escriba un procedimiento para 
#    extraer las posiciones donde está el valor mínimo en el vector.

x1 <- (c(1,-4,5,9,-4))

which(x1 == min(x1))


# 7. Calcular  8!

factorial_8 <- prod(1:8)
factorial_8

# 8. Evaluar la siguiente suma  

x <- 0
for(i in 3:7){
               x <- x + exp(i)
             }
x

# 9. Evaluar la siguiente productoria

x <- 0
for(i in 1:10){
              x <- x * log(sqrt(i))
             }
x


# 10. Construya un vector cualquiera e inviertalo, es decir, que el primer elemento quede de último, 
#     el segundo de penúltimo y así sucesivamente. Compare su resultado con el de la función rev.

vect1 <- c(1:10)
vect1

# Método 1
vect2 <- order(vect1, decreasing = TRUE)
vect2

# Método 2
rev(vect1)


# 11. Create the vector:  1,2,3,…,19,20.

m <- c(1:20)
m

# 12. Create the vector: 20,19,...,2,1.

n <- c(20:1)
n

rev(m)

# 13. Create the vector: 1,-2,3,-4,5,-6,...,19,-20.

u1 <- seq(1,19,by=2)
u1
u2 <- seq(-2,-20,by=-2)
u2

u3 <- as.numeric(rbind(u1,u2))
u3

# 14. Create the vector: 0.1^3, 0.2^1, 0.1^6, 0.2^4,...0.1^36,0.2^34.

exp1 <- seq(3,36,by=3)
exp2 <- seq(1,34,by=3)

vect_v <- as.numeric(rbind(0.1^exp1,0.2^exp2))
vect_v

# 15. Calculate the following:

for (i in 10:100) {
                   resultado_1 <- (i**3 + 4 *i**2)
                  }

resultado_1


for (j in 10:100) {
                   resultado_2 <- (((2**j)/j) + ((3**j)/(j**2)))
                  }

resultado_2


# 16. Read the data set available in: 
#https://raw.githubusercontent.com/fhernanb/datos/master/Paises.txt


data <- read.table(file = "https://raw.githubusercontent.com/fhernanb/datos/master/Paises.txt", header = TRUE)
head(data)


# 17. Use a code to obtain the number of variables of the data set

ncol(data)

# 18. Use a code to obtain the number of countries in the data set.

nrow(data)

# 19. Which is the country with the higher population?

data[which.max(data$poblacion),]

# 20. Which is the country with the lowest literacy rate?

data[which.min(data$alfabetizacion),]

# 21. ¿Qué valor de verdad tiene la siguiente afirmación? 
#     “Los resultados de la función floor y trunc son siempre los mismos”.

floor(-1.1) == trunc(-1.1)

# 22. Autos que tengan un rendimiento menor a 18 millas por galón de combustible.

mtcars

mtcars[mtcars$mpg < 18,]

# 23. Autos que tengan 4 cilindros

mtcars[mtcars$cyl == 4,]

# 24. Autos que pesen más de 2500 libras y tengan transmisión manual.

mtcars[(mtcars$wt > 2.5)&(mtcars$am ==1),]



# CAPITULO 7

# 1. Construya una función que reciba dos números reales a y b, 
#    la función debe decir cuál es el mayor de ellos.

mayor <- function(a,b){

  
  if (a>b){
           return(a)
          }
  
  else {
         if(a<b){
                 return(b)
                }
         else{
              cat("Los números deben de ser diferentes") 
             }
       }
          
} 

mayor(5,31)
mayor(-3,-1)
mayor(6,6)


# 2. Escriba una función llamada media que calcule la media muestral 
#    de un vector numérico x ingresado a la función. A continuación la 
#    fórmula para calcular la media muestral.

media_m <- function(x){
  
  total <- sum(x)
      n <- length(x)
  
      med_m <- total / n
      
  return(med_m)
  
}

a<- c(1:10)

media_m(a)

# 3. Construya una función que encuentre las raíces de una ecuación de segundo grado. 
#    El usuario debe suministrar los coeficientes a, b y c de la ecuación  ax2+bx+c=0
#    y la función debe entregar las raíces.

raices <- function(a,b,c){
  
  d <- ((b*b)-(4*a*c))
  
  if (d >= 0){
              r1 <- (-1*b + sqrt(d))/(2*a)
              r2 <- (-1*b - sqrt(d))/(2*a)
            
              cat("Las raíces son complejas r1=",r1," y ", "r2= ",r2)
             }
  
  else{
        r1 <- (-b + sqrt(-1*d))/(2*a)
        r2 <- (-b - sqrt( -1*d))/(2*a)
        
        cat("Las raíces son complejas r1=",r1,"i"," y ", "r2=",r2,"i")
      }
} 

raices(1,-10,25)
raices(2,7,13)

# 4. Escribir una función que calcule la velocidad de un proyectil dado que el usuario 
#    ingresa la distancia recorrida en Km y el tiempo necesario en minutos. Expresar el 
#    resultado se debe entregar en metros/segundo, recuerde que

velocidad <- function(d,t){
  
  dam <- d*1000 
   ts <- t*60   
    v <- dam/ts
  
  return(v)
}

velocidad(1500,20)

# 5. Escribir una función que reciba dos valores  a y b y que los intercambie. 
#    Es decir, si ingresa a = 4 y  b = 9 que la función entregue   a = 9 y   b = 4.

intercambio <- function(a,b){
  
                             cat("a=", b, " y b=",a)
  
                            }
intercambio(5,3)


# 6. Construya una función a la cual le ingrese el salario por hora y el número de 
#    horas trabajadas durante una semana por un trabajador. La función debe calcular el salario neto.

sueldo <- function(sal.hr, num.hr){
                                    return(sal.hr*num.hr)
                                  }

sueldo(125.50,48)

# 7. Construya una función llamada precio que calcule el precio total de sacar A 
#    fotocopias y B impresiones, sabiendo que los precios son 50 y 100 pesos para 
#    A y B respectivamente si el cliente es un estudiante, y de 75 y 150 para A y 
#    B si el cliente es un profesor. La función debe tener dos argumentos 
#    cuantitativos (A y B) y el argumento lógico estudiante que por defecto tenga 
#    el valor de TRUE. Use la estructura mostrada abajo.


precio <- function(A, B, estudiante=TRUE) {
  
                                           if(estudiante!=TRUE){
                                                                precio.total <- A*75 + B*150
                                                               }
  
                                           else{
                                                precio.total <- A*50 + B*100
                                               }
  
                                           return(precio.total)
                                          }

precio(23,10,estudiante=FALSE)
precio(23,10,estudiante=TRUE)


# 8. Construya una función llamada salario que le ingrese el salario por hora y el 
#    número de horas trabajadas durante una semana por un trabajador. La función debe 
#    calcular el salario neto semanal, teniendo en cuenta que si el número de horas 
#    trabajadas durante la semana es mayor de 48, esas horas de demás se consideran 
#    horas extras y tienen un 35% de recargo. Imprima el salario neto. Use la estructura 
#    mostrada abajo.

salario <- function(num.horas, valor.hora) {
  
  if(num.horas>48){
                   salario.neto <- (48*valor.hora) + (num.horas-48)*(valor.hora*0.35)
                  }
  else{
       salario.neto <- (48*valor.hora)
      }
  
  return(salario.neto)
}

salario(56,200)


# 9. Construya una función llamada nota que calcule la nota obtenida por un alumno 
#    en una evaluación de tres puntos cuya ponderación o importancia son 20%, 30% y 
#    50% para los puntos I, II y III respectivamente. Adicionalmente la función debe 
#    generar un mensaje sobre si el estudiante aprobó la evaluación o no. El usuario 
#    debe ingresar las notas individuales de los tres puntos y la función debe entregar 
#    la nota final de la evaluación. Use la estructura mostrada abajo.

nota <- function(p1, p2, p3) {
  
                              pf <- sum(p1*0.2,p2*0.3,p3*0.5)
  
                              if(pf>=6){
                                        cat("APROBASTE LA EVALUACIÓN")
                                       }
  
                              else{
                                   cat("NO APROBASTE LA PRUEBA")
                                  }
  
                              cat(" TU CALIFICACIÓN ES: ",pf)
                             }

nota(5,8,6)

# 10. Escriba una función llamada minimo que permita obtener el valor mínimo de 
#     un vector numérico. No puede usar ninguna de las funciones básicas de R como 
#     which.min(), which.max(), order(), min( ), max( ), sort( ) u order( ). Use 
#     la estructura mostrada abajo.

minimo <- function(x) {
  
          for( i in 2:length(x)){
                                for(j in i:2){
                                              if(x[j-1] > x[j]){
                                                                c  <- x[j]
                                                                x[j] <- x[j-1]
                                                                x[j-1] <- c
                                                               }
                                             }
                              }
  nminimo <- x[1]
       
  return(nminimo)
}

x <- c(5,18,0,6,4,2)

minimo(x)

# 11. Construya una función que calcule las coordenadas del punto medio  M entre 
#     dos puntos  A y B. Vea la siguiente figura para una ilustración. ¿Cuáles cree 
#     usted que deben ser los parámetros de entrada de la función?

punto_medio <- function(x1,y1,x2,y2){

                                     x <- (x1+x2)/2
                                     y <- (y1+y2)/2
  
                                     cat("El punto medio es PM(",x,",",y,")")
                                    }

punto_medio(1,2,-1,2)
