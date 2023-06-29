# CLASE 05 - JUEVES 20 DE ABRIL DE 2023

# La librería Sofi junto con Shiny; combina un dashboard interactivo con el aprendizaje de la 
# materia de estadística generando una serie de actividades.Es una librería reciente que data 
# del 12 de Octubre del 2022.

#Cargar librerías
library(shiny)
library(Sofi)



# Esta primera instrucción desplega diferentes ejercicios de acuerdo al índice ingresado
# 1 - Ejercicios de distribución
# 2 - Muestra las distribuciones de probabilidad
# 3 - Menú general de Sofi
# 4 - Gráficos de datos (Muestra ligeros problemas con algunos paquetes)
# Y además de brindarte información sobre el tema, te permite resolver diversas actividades.

if (interactive()) {  Estadistica(1) }  # Sólo modificamos el número del parametro Estadística

if (interactive()) {  Estadistica(2) }

if (interactive()) {  Estadistica(3) }

# Esta función desplega una ventana interactiva donde puedes generar muestras de defunciones
if (interactive()) { Defunciones()} 


# RANDU: el caso de los malos RNG (Tiene ciertos errores de visualización)
if (interactive()) { Estadistica7()}



# Asigna un valor numérico a cada uno de los datos.
Capis<-c("P456","C682","M613","F629","X392")
DefCap(Capis)


# Genera muestras de datos de acuerdo con la clasificación internacional de enfermedades (CIE-10)
data(DatPru)
DatCap    # Ejemplos de códigos dentro del CIE-10                     
InfCap    # Información de las muestras



# Esta función crea la muestra para los datos de defunciones
Etapa01(IDm=DatCap[,1], CausaD=DatCap[,2], n=InfCap$n)

