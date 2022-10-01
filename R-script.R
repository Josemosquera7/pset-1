#Santiago Huertas
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
