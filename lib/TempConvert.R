#Converts Fahrenheit to Kelvin
F_to_K <- function(temp) {
    K <- ((temp - 32) * (5/9)) + 273.15
    K
}
#Converts Kelvin to Celsius
K_to_C <- function(temp) {
  C <- temp - 273.15
  C
}
#Converts Fahrenheit to Celsius
F_to_C <- function(temp) {
 K_temp <- F_to_K(temp)
	result <- K_to_C(K_temp)
  result
}
