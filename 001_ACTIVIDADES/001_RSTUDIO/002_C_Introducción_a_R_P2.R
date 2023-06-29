# CLASE 03 - MARTES 28 DE MARZO DE 2023

#Lectura del archivo
datos<- read.csv("C:/Users/rjmz2/OneDrive/Escritorio/DIPLOMADO CDM/001_R/02_28_03_2023/iris.csv")
datos

#FUNCIONES BASE
nrow(datos) #Total de renglones
ncol(datos) #Total de columnas
dim(datos)  #Nos muestra columnas y renglones de la base de datos
str(datos)  #Da un panorama general de la base de datos

#Mostrar el contenido de una columna
datos$Species

#Guardar base de datos
BD2 <- data.frame(x=1:5, y=letters[1:5])
write.csv(BD2, "C:/Users/rjmz2/OneDrive/Escritorio/DIPLOMADO CDM/001_R/02_28_03_2023/BD2.csv") 

#INSTALACIÓN DE PAQUETES
install.packages("data.table")
install.packages("tidyverse")
install.packages("dplyr")
install.packages("readr")
install.packages("readxl")
install.packages("microbenchmark")

#CARGAR LIBRERÍAS
library(data.table)
library(microbenchmark)
library(readxl)
library(dplyr)
library(ggplot2)

#Lectura de archivo
fread("C:/Users/rjmz2/OneDrive/Escritorio/DIPLOMADO CDM/001_R/02_28_03_2023/iris.csv")

#Revisar velocidad de operación
microbenchmark(base=read.csv("C:/Users/rjmz2/OneDrive/Escritorio/DIPLOMADO CDM/001_R/02_28_03_2023/iris.csv"),
               data_table=fread("C:/Users/rjmz2/OneDrive/Escritorio/DIPLOMADO CDM/001_R/02_28_03_2023/iris.csv"),
               time= 20)

1733650/1651900 #Diferencia de tiempos de ejecución

#Función fread
x<-fread(input = "date, count
         2022-12-27 00:00:00, 0
         2022-12-27 00:01:00, 0
         2023-01-03 00:00:00, 0
         2023-01-03 00:01:00, 0
         2023-01-10 00:00:00, 0
         2023-01-10 00:01:00, 0
         2023-01-17 00:00:00, 1
         2023-01-17 00:01:00, 0
        ")
#Si se hace el cambio de input por text lo leerá de la misma forma
#fread(cmd = "head C:/Users/rjmz2/OneDrive/Escritorio/DIPLOMADO CDM/001_R/02_28_03_2023/iris.csv")

#Selección de información
fread("C:/Users/rjmz2/OneDrive/Escritorio/DIPLOMADO CDM/001_R/02_28_03_2023/iris.csv", nrows = 3, select = c(1,2))
fread("C:/Users/rjmz2/OneDrive/Escritorio/DIPLOMADO CDM/001_R/02_28_03_2023/iris.csv", nrows = 3, select = c("Sepal.Length","Species"))

#Skip
fread("C:/Users/rjmz2/OneDrive/Escritorio/DIPLOMADO CDM/001_R/02_28_03_2023/iris.csv", skip = 100)
fread("C:/Users/rjmz2/OneDrive/Escritorio/DIPLOMADO CDM/001_R/02_28_03_2023/iris.csv", skip="Sepal.Length")


##TIDYVERSE
readr::read_csv("C:/Users/rjmz2/OneDrive/Escritorio/DIPLOMADO CDM/001_R/02_28_03_2023/iris.csv")

readxl_example

#readxl
datasets<-readxl_example("datasets.xlsx")
read_excel(datasets)

#Seleccionar base utilizando localización o nombre
read_excel(datasets, 2)
read_excel(datasets, "mtcars")

#skip
read_excel(datasets, skip = 148, col_names = FALSE)

#Pasar tipos de datos
read_excel(datasets, col_types = "text")

#Seleccionando información con más atributos
read_excel(datasets, col_types = c("text","guess","numeric","guess","guess"))

#
df<-read_excel(readxl_example("clippy.xlsx"), col_types=c("text","list"))
df
df$value
sapply(df$value, class) #Función similar a un ciclo for

#Limite de renglones por leer
read_excel(datasets, n_max = 3)

#Lectura por rangos 
read_excel(datasets, range = "C1:E7")
read_excel(datasets, range = "R1C2:R2C5")

#Especificar base y rango de lectura
read_excel(datasets, range = "mtcars!B1:D5")

#Especificar columnas o celdas
read_excel(datasets, range = cell_rows(102:151), col_names = FALSE)
read_excel(datasets, range = cell_cols("B:D"))

#Asignar nombre a las columnas de forma estandar
read_excel(
           readxl_example("deaths.xlsx"),
           range = "arts!A5:F15",
           .name_repair = "universal"
          )


#DPLYR
mtcars
mtcars1<-mtcars
rownames(mtcars1)
mtcars1$modelo<-rownames(mtcars1)           

#MUTATE - Modificar información
mtcars2 <-mtcars
mutate(mtcars2, modelo = rownames(mtcars2))
mutate(mtcars2, modelo = tolower(rownames(mtcars2)))
#Es necesario asignar o guardar los cambios para preservarlos

#PIPE
log10(exp(sin(0)))
 
0%>%sin() #f(x)

mtcars2 <- mtcars2 %>%
           mutate(modelo =rownames(mtcars2), modelo_lower = tolower(modelo))
mtcars2

#FILTER - Filtrado de datos
filter(mtcars2, mpg>20)
mtcars2 %>% filter(mpg>20,hp>100)

mtcars2 %>%
  mutate(modelo =rownames(mtcars2)) %>%
  filter(mpg>20,hp>100)

#SELECT - Seleccionar columnas
select(mtcars2, mpg, cyl) #DPLYR
mtcars2[,c("mpg","cyl")]  #ESTANDAR

mtcars2 %>%
  mutate(modelo =rownames(mtcars2)) %>%
  filter(mpg>20,hp>100) %>%
  select(mpg,cyl)

#Se puede dejar de trabajar con una variable si se iguala a NULL

#ARRANGE - Reordenar de acuerdo a un criterio
arrange(mtcars2, mpg)

#SUMMARISE - Resumen de los datos
mtcars2 %>% 
        summarise(mean_hp = mean(hp), max_hp = max(hp), min_hp = min(hp))

#GROUP_BY - Agrupar datos
mtcars2 %>%
        group_by(cyl)%>%
        summarise(mean_hp = mean(hp), median_hp = median(hp))

#GRAFICOS
mtcars %>%
       filter(hp<=150) %>%
       mutate(am = as.factor(am)) %>%
       ggplot(aes(x = am, y = mpg)) + geom_boxplot()

#COMPARACIÓN CON DATA.TABLE
dt_mtcars <- as.data.table(mtcars)

#Filtrado
filter(mtcars2, mpg>20) #DPLYR
dt_mtcars[mpg>=20]      #DT

#Agregar columnas
mutate2 <- mutate(mtcars2, double_hp = 2*hp) #DPLYR
dt_mtcars[,double_hp := 2* hp][]              #DT

#SUMMARY
summarise(mtcars2, mean_hp = mean(hp), max_hp = max(hp), min_hp = min(hp)) #DPLYR
dt_mtcars[, .(mean_hp = mean(hp), max_hp = max(hp), min_hp = min(hp))]     #DT


##EJERCICIOS
iris

# 1. Número de renglones Sepal.Length mayor a 5.1

iris %>%
      filter(Sepal.Length > 5.1) %>%
      summarise(total = n())

# 2. Número de renglones Petal.Length menor o igual a 1.5

iris %>%
  filter(Petal.Length <= 1.5) %>%
  summarise(total = n())

# 3. Promedio de Sepal.Width por Species

iris %>%
     group_by(Species) %>%
     summarise( mean_Species = mean(Sepal.Width))
  
# 4. Mediana de Sepal.Width por Species

iris %>%
  group_by(Species) %>%
  summarise( median_Species = median(Sepal.Width))

# 5. Máximo de Petal.Length por Species

iris %>%
  group_by(Species) %>%
  summarise( max_Species = max(Petal.Length))

# 6. Mínimo de Petal.Length por Species

iris %>%
  group_by(Species) %>%
  summarise( min_Species = min(Petal.Length))
