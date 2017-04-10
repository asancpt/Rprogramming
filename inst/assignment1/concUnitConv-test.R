source("D:/G/Desk/R/concUnitConv.R")

concUnitConv() # Wrong input
concUnitConv("kg/L", "g/L") # Wrong input
concUnitConv("g/kL", "g/L") # Wrong input

concUnitConv("mg/L", "ug/mL")
Theoph$conc * concUnitConv("mg/L", "ug/L")
Theoph$conc * concUnitConv("mg/L", "mg/mL")
Theoph$conc * concUnitConv("mg/L", "mmol/L") # Wrong input
Theoph$conc * concUnitConv("mg/L", "mmol/L", MW=-100) # Wrong input
Theoph$conc * concUnitConv("mg/L", "mM", MW=180.164) # Wrong input
Theoph$conc * concUnitConv("mg/L", "mmol/L", MW=180.164)
Theoph$mM = Theoph$conc * concUnitConv("mg/L", "mmol/L", MW=180.164)
Theoph$mM * concUnitConv("mmol/L", "ug/L", MW=180.164)
Theoph$mM * concUnitConv("mmol/L", "ug/mL", MW=180.164)

