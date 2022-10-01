#Santiago Huertas 202021311
#Jose Mosquera 202110281
#David Chaparro 202023984
#R version 4.2.1 (2022-06-23 ucrt)
rm(list=ls())
require(pacman)
p_load(rio)
p_load(tidyverse)
p_load(dplyr, tidyr, tibble, data.table) 
#1 Vectores

vector_pares<-1:100
vector_impares <- seq(1,99,by=2)
vector_3 <- 1:100 
vector_f<- vector_3[-(vector_impares)]

#2 Importar

caracteristicas_generales <-import(file="input/Enero - Cabecera - Caracteristicas generales (Personas).csv", encoding="UTF-8")
ocupados <-import(file="input/Enero - Cabecera - Ocupados.csv", encoding="UTF-8")

# 2.2 exportar
export(x=caracteristicas_generales, file="output/Caracteristicas generales (Personas).rds")
export(x=ocupados, file="output/Ocupados.rds")

# 3. Agregar variables a un conjunto de datos existente. 
## Para este caso, es posible usar el simbolo "$" para agregar variables a el conjunto de datos existentes.Paralelamente, se puede usar la función mutate de la librería dplyr

##3.1 Generar variables con 1. Note que antes de correr este código, la base de datos tiene 165 variables
ocupados_1 <- mutate(.data= ocupados, ocupado= 1)
##definimos la base de datos, y luego ponemos el nombre de la variable que queremos crear y la condición. Creamos un nuevo objeto que contenga esa variable

##3.b generar una variable condicionada
caracteristicas_condicionada <- mutate(caracteristicas_generales, joven = ifelse(test= P6040>=18 & P6040<=28 , yes=1 ,no=0))
##De este modo, usando una función ifelse dentro de mutato, logramos crear una nuueva variable donde el si el individuo es mayo a 18 y menor a 28, tendrá un valos de 1

##4.a eliminar filas y columnas de un conjunto de datos 

caracteristicas_generales %>%
  subset(P6040 > 70 & P6040 < 18) 

##4.b crear una base que solo tenga determindas variables
caracteristicas_generales_interés<- select(caracteristicas_generales, SECUENCIA_P, ORDEN,
                                     HOGAR, DIRECTORIO, P6020, P6040, P6920, DPTO, fex_c_2011, ESC, MES)
##En este caso, creamos el objeto caracteristicas_generales_interes que solo incluye las variables de interés. Para esto, se utilizó la función select()


##4.c
Ocupados_interes <-  select(ocupados_1, DIRECTORIO, SECUENCIA_P, ORDEN,HOGAR, ocupado, INGLABO, P6050)
##En este caso, creamos el objeto Ocupados_interes que solo incluye las variables de interés. Para esto, se utilizó la función select()
