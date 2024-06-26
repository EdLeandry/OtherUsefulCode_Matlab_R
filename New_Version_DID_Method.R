install.packages("readstata13")
library(readstata13)
install.packages("ggplot2")
library(ggplot2)
install.packages("tidyverse")
library(tidyverse)
install.packages("stringr")
library(stringr)
install.packages("sjPlot")
library(sjPlot)
install.packages("xlsx")
library(xlsx)
install.packages("lmtest")
library(lmtest)


var_need18 = c("hhid", "pn", "qx060_r", "qx067_r", "qz099", "qz103", "qz118", "qz122","qz123",
               "qz124", "qz125", "qz127", "qz201", "qc002", "qc018","qc021m1","qc021m2","qc023",
               "qc024", "qc028", "qh004", "qj005m1","qj510m1","qj517", "qj524m1", "qj527", "qj535",
               "qn001","qn002m1", "qn004", "qn005", "qn006", "qn290", "qn023")

var_need10 = c("hhid", "pn", "qx060_r", "qx067_r", "qz099", "qz103", "qz118", "qz122", "qz123",
               "qz124", "qz125", "qz127", "qz201","qc002", "qc018","qc021m1", "qc021m2",
               "qc023", "qc024", "qc028", "qh004", "qj005m1", "qj510m1","qj517", "qj524m1",
               "qj527", "qj535", "qn001","qn002m1", "qn004", "qn005", "qn006", "qn023")

HRS2018 = read.dta13("Datasets/h18f2a_STATA/h18f2a.dta")

var_need16 = str_replace_all(var_need18, "q", "p")
HRS2016 = read.dta13("Datasets/h16f2b_STATA/h16f2b.dta")

var_need14 = str_replace_all(var_need18, "q", "o")
HRS2014 = read.dta13("Datasets/h14f2b_STATA/h14f2b.dta")

var_need12 = str_replace_all(var_need18, "q", "n")
HRS2012 = read.dta13("Datasets/h12f3a_STATA/h12f3a.dta")

var_need10_new = str_replace_all(var_need10, "q", "m")
HRS2010 = read.dta13("Datasets/hd10f6a_STATA/hd10f6a.dta")
#------------------------------------------------------------------------------------------------------------------------------------#

HRS2018_Cancer = subset(HRS2018, (qc018 == "1" | qc018 == "5")  & (qz103 == "5" | qz103 == "1" ), select = var_need18)
HRS2018_Cancer = HRS2018_Cancer[!(is.na(HRS2018_Cancer$qj005m1) | HRS2018_Cancer$qj005m1 == "6" | HRS2018_Cancer$qj005m1 == "7" |
                                    HRS2018_Cancer$qj005m1 == "98" |  HRS2018_Cancer$qj005m1 == "99" | HRS2018_Cancer$qn023 == "-8" | 
                                    HRS2018_Cancer$qn023 == "98" | HRS2018_Cancer$qn023 == "99"),]
HRS2018_Cancer$hhidpn = paste(HRS2018_Cancer$hhid, HRS2018_Cancer$pn, sep = "")

HRS2016_Cancer = subset(HRS2016, (pc018 == "1" | pc018 == "5") & (pz103 == "1" | pz103 == "5")  , select = var_need16)
HRS2016_Cancer = HRS2016_Cancer[!(is.na(HRS2016_Cancer$pj005m1) | HRS2016_Cancer$pj005m1 == "6" | HRS2016_Cancer$pj005m1 == "7" |
                              HRS2016_Cancer$pj005m1 == "98" |  HRS2016_Cancer$pj005m1 == "99"| HRS2016_Cancer$pn023 == "-8" | 
                              HRS2016_Cancer$pn023 == "98" | HRS2016_Cancer$pn023 == "99"),]
HRS2016_Cancer$hhidpn = paste(HRS2016_Cancer$hhid, HRS2016_Cancer$pn, sep = "")

HRS2014_Cancer = subset(HRS2014, (oc018 == "1" | oc018 == "5") & (oz103 == "1" | oz103 == "5") , select = var_need14)
HRS2014_Cancer = HRS2014_Cancer[!(is.na(HRS2014_Cancer$oj005m1) | HRS2014_Cancer$oj005m1 == "6" | HRS2014_Cancer$oj005m1 == "7" |
                                    HRS2014_Cancer$oj005m1 == "98" |  HRS2014_Cancer$oj005m1 == "99"| HRS2014_Cancer$on023 == "-8" | 
                                    HRS2014_Cancer$on023 == "98" |  HRS2014_Cancer$on023 == "99"),]
HRS2014_Cancer$hhidpn = paste(HRS2014_Cancer$hhid, HRS2014_Cancer$pn, sep = "")

HRS2012_Cancer = subset(HRS2012, (nc018 == "1" | nc018 == "5") & (nz103 == "1" | nz103 == "5"), select = var_need12 )
HRS2012_Cancer = HRS2012_Cancer[!(is.na(HRS2012_Cancer$nj005m1) | HRS2012_Cancer$nj005m1 == "6" | HRS2012_Cancer$nj005m1 == "7" |
                                    HRS2012_Cancer$nj005m1 == "98" |  HRS2012_Cancer$nj005m1 == "99"| HRS2012_Cancer$nn023 == "-8" | 
                                    HRS2012_Cancer$nn023 == "98" | HRS2012_Cancer$nn023 == "99"),]
HRS2012_Cancer$hhidpn = paste(HRS2012_Cancer$hhid, HRS2012_Cancer$pn, sep = "")

HRS2010_Cancer = subset(HRS2010, (mc018 == "1" | mc018 == "5") & (mz103 == "1" | mz103 == "5") , select = var_need10_new )
HRS2010_Cancer = HRS2010_Cancer[!(is.na(HRS2010_Cancer$mj005m1) | HRS2010_Cancer$mj005m1 == "6" | HRS2010_Cancer$mj005m1 == "7" |
                                    HRS2010_Cancer$mj005m1 == "98" |  HRS2010_Cancer$mj005m1 == "99"| HRS2010_Cancer$mn023 == "-8" | 
                                    HRS2010_Cancer$mn023 == "98" | HRS2010_Cancer$mn023 == "99"),]
HRS2010_Cancer$hhidpn = paste(HRS2010_Cancer$hhid, HRS2010_Cancer$pn, sep = "")

# ------------------------------------------------------------------------------------------------------------------------ # 

HRS2010_Cancer_sub = subset(HRS2010_Cancer, select=c("mx060_r","mx067_r","mz103", "mc018", "mj005m1", "mn023", "hhidpn"))
HRS2012_Cancer_sub = subset(HRS2012_Cancer, select=c("nx060_r","nx067_r","nz103", "nc018", "nj005m1", "nn023", "hhidpn"))
HRS2014_Cancer_sub = subset(HRS2014_Cancer, select=c("ox060_r","ox067_r","oz103", "oc018", "oj005m1", "on023", "hhidpn"))
HRS2016_Cancer_sub = subset(HRS2016_Cancer, select=c("px060_r","px067_r","pz103", "pc018", "pj005m1", "pn023", "hhidpn"))
HRS2018_Cancer_sub = subset(HRS2018_Cancer, select=c("qx060_r","qx067_r","qz103", "qc018", "qj005m1", "qn023", "hhidpn"))

HRS2010_2012 = merge(HRS2010_Cancer_sub, HRS2012_Cancer_sub, by = "hhidpn")
# M = 1, F = 0
HRS2010_2012$mx060_r = ifelse(HRS2010_2012$mx060_r == "1", 1, 0) 
HRS2010_2012$nx060_r = ifelse(HRS2010_2012$nx060_r == "1", 1, 0)
# E = 1, NE = 0
HRS2010_2012$mj005m1 = ifelse(HRS2010_2012$mj005m1 == "1", 1, 0)
HRS2010_2012$nj005m1 = ifelse(HRS2010_2012$nj005m1 == "1", 1, 0) 
# C = 1, NC = 0
HRS2010_2012$mz103 = ifelse(HRS2010_2012$mz103 == "1", 1, 0)
HRS2010_2012$nz103 = ifelse(HRS2010_2012$nz103 == "1", 1, 0) 
HRS2010_2012$mc018 = ifelse(HRS2010_2012$mc018 == "1", 1, 0)
HRS2010_2012$nc018 = ifelse(HRS2010_2012$nc018 == "1", 1, 0) 

# ------------------------------------------------------------------------------------------------------------------------ # 

HRS2014_2016 = merge(HRS2014_Cancer_sub, HRS2016_Cancer_sub, by = "hhidpn")
# M = 1, F = 0
HRS2014_2016$ox060_r = ifelse(HRS2014_2016$ox060_r == "1", 1, 0) 
HRS2014_2016$px060_r = ifelse(HRS2014_2016$px060_r == "1", 1, 0)
# E = 1, NE = 0
HRS2014_2016$oj005m1 = ifelse(HRS2014_2016$oj005m1 == "1", 1, 0)
HRS2014_2016$pj005m1 = ifelse(HRS2014_2016$pj005m1 == "1", 1, 0) 
# C = 1, NC = 0
HRS2014_2016$oz103 = ifelse(HRS2014_2016$oz103 == "1", 1, 0)
HRS2014_2016$pz103 = ifelse(HRS2014_2016$pz103 == "1", 1, 0) 
HRS2014_2016$oc018 = ifelse(HRS2014_2016$oc018 == "1", 1, 0)
HRS2014_2016$pc018 = ifelse(HRS2014_2016$pc018 == "1", 1, 0) 
# ------------------------------------------------------------------------------------------------------------------------ # 

HRS2018_Cancer_sub$qx060_r = ifelse(HRS2018_Cancer_sub$qx060_r == "1", 1, 0) 
HRS2018_Cancer_sub$qj005m1 = ifelse(HRS2018_Cancer_sub$qj005m1 == "1", 1, 0) 
HRS2018_Cancer_sub$qz103 = ifelse(HRS2018_Cancer_sub$qz103 == "1", 1, 0) 
HRS2018_Cancer_sub$qc018 = ifelse(HRS2018_Cancer_sub$qc018 == "1", 1, 0) 
# ------------------------------------------------------------------------------------------------------------------------ # 

HRS2010_2016 = merge(HRS2010_2012, HRS2014_2016, by="hhidpn")
HRS2010_2018 = merge(HRS2010_2016, HRS2018_Cancer_sub, by="hhidpn")
HRS2010_2018 = na.omit(HRS2010_2018)

write.xlsx2(HRS2010_2018, file = "HRS2010_2018_Insur.xlsx", row.names = T,
            col.names = T)

# Could have been fixed in excel beforehand but forgot.
NewHRS2010_2018 = read.xlsx2("HRS2010_2018Complete.xlsx",1)
NewHRS2010_2018$Age = as.numeric(NewHRS2010_2018$Age)
NewHRS2010_2018$Sex = as.numeric(NewHRS2010_2018$Sex)
NewHRS2010_2018$PrevWave_Cancer = as.numeric(NewHRS2010_2018$PrevWave_Cancer)
NewHRS2010_2018$CurrWave_Cancer = as.numeric(NewHRS2010_2018$CurrWave_Cancer)
NewHRS2010_2018$EmployStatus = as.numeric(NewHRS2010_2018$EmployStatus)
NewHRS2010_2018$Del_Employ_Stat = as.numeric(NewHRS2010_2018$Del_Employ_Stat)
# ------------------------------------------------------------------------------------------------------------------------ # 


NewHRS2010_2018$Cancer = ifelse(NewHRS2010_2018$PrevWave_Cancer == "0" & NewHRS2010_2018$CurrWave_Cancer == "1" , 1, 0)
NewHRS2010_2018$Working_Age = ifelse(NewHRS2010_2018$Age <= "67", 1 ,0)

Pooled_OLS1 = lm(EmployStatus ~ factor(Year) + Cancer,  data = NewHRS2010_2018)
coeftest(Pooled_OLS1, vcov = vcov)
summary(Pooled_OLS1)
Pooled_OLS2 = lm(EmployStatus ~ factor(Year) + Cancer + Sex + Working_Age,  data = NewHRS2010_2018)
coeftest(Pooled_OLS2, vcov = vcov)
summary(Pooled_OLS2)
# ------------------------------------------------------------------------------------------------------------------------ # 
#Include matching step here before running 


DT1 = tab_model(Pooled_OLS1,Pooled_OLS2, show.se = T, show.p = T, p.style = "stars", 
                pred.labels = c("Intercept","Y2012", "Y2014", "Y2016", "Y2018", "Cancer", "Sex", " Working Age"),
                dv.labels = c("Model 1", "Model 2"), title = "Pooled Regressions")
print(DT1)

PreTrend_Reg1 = lm(Del_Employ_Stat ~ factor(Year) + Cancer + Sex + Working_Age, data = NewHRS2010_2018)
coeftest(PreTrend_Reg1, vcov = vcov)
summary(PreTrend_Reg1)

DT2 = tab_model(PreTrend_Reg1, show.se = T, show.p = T, p.style = "stars", 
                pred.labels = c("Intercept","Y2012", "Y2014", "Y2016", "Y2018", "Cancer", "Sex", " Working Age"),
                dv.labels = c("Model 3"), title = "Pre-trends")
print(DT2)
# ------------------------------------------------------------------------------------------------------------------------ # 

NewHRS2010_2018_ByAge = NewHRS2010_2018
NewHRS2010_2018_ByAge$Group1 = ifelse(NewHRS2010_2018_ByAge$Age <= "49", 1, 0)
NewHRS2010_2018_ByAge$Group2 = ifelse(NewHRS2010_2018_ByAge$Age >= "50" & NewHRS2010_2018_ByAge$Age <= "69" , 1, 0)
NewHRS2010_2018_ByAge$Group3 = ifelse(NewHRS2010_2018_ByAge$Age >= "70" & NewHRS2010_2018_ByAge$Age <= "89" , 1, 0)
NewHRS2010_2018_ByAge$Group4 = ifelse(NewHRS2010_2018_ByAge$Age >= "90", 1, 0)
 
Pooled_OLS_ByAge = lm(EmployStatus ~ factor(Year) + Group1 + Group2 + Group3 + Cancer + Sex, data = NewHRS2010_2018_ByAge)
summary(Pooled_OLS_ByAge)

DT3 = tab_model(Pooled_OLS_ByAge, show.se = T, show.p = T, p.style = "stars", 
                    pred.labels = c("Intercept","Y2012", "Y2014", "Y2016", "Y2018", "AG1", "AG2", "AG3", "Cancer", "Sex"),
                    dv.labels = c("Model 4"), title = "Pooled Regressions Using Age Groups")
print(DT3)
 # ------------------------------------------------------------------------------------------------------------------------ # 

NewHRS2010_2018$Insurance = ifelse(NewHRS2010_2018$Insurance >= "1", 1 ,0)
Pooled_OLS_Ins = lm(EmployStatus ~ factor(Year) + Cancer + Sex + Working_Age + Insurance,  data = NewHRS2010_2018)
coeftest(Pooled_OLS_Ins, vcov = vcov)
summary(Pooled_OLS_Ins)

DT4 = tab_model(Pooled_OLS_Ins, show.se = T, show.p = T, p.style = "stars", 
                    pred.labels = c("Intercept","Y2012", "Y2014", "Y2016", "Y2018", "Cancer", "Sex", "Working Age", "Insur"),
                    dv.labels = c("Model 5"), title = "Pooled Regressions Including Insurance")
print(DT4)
# ------------------------------------------------------------------------------------------------------------------------ # 

Mean_Age = mean(NewHRS2010_2018$Age)
Mean_Employed = mean(NewHRS2010_2018$EmployStatus == "1")
Mean_Not_Employed = mean(NewHRS2010_2018$EmployStatus == "0")
Mean_Cancerdummy = mean(NewHRS2010_2018$Cancer == "1")
Mean_WorkingAge = mean(NewHRS2010_2018$Working_Age == "1")
Mean_SexM = mean(NewHRS2010_2018$Sex == "1")
MeanSexF = mean(NewHRS2010_2018$Sex == "0")
Mean_InsCov = mean(NewHRS2010_2018$Insurance =="1")

SD_Age = sd(NewHRS2010_2018$Age)
SD_Employed = sd(NewHRS2010_2018$EmployStatus == "1")
SD_Not_Employed = sd(NewHRS2010_2018$EmployStatus == "0")
SD_Cancerdummy = sd(NewHRS2010_2018$Cancer == "1")
SD_WorkingAge = sd(NewHRS2010_2018$Working_Age == "1")
SDSexM = sd(NewHRS2010_2018$Sex == "1")
SDSexF = sd(NewHRS2010_2018$Sex == "0")
SD_InsCov = sd(NewHRS2010_2018$Insurance =="1")

# ------------------------------------------------------------------------------------------------------------------------ # 
#Propensity scoring using Logistic regression:

PScore = glm(Cancer ~ Group1 + Group2 + Group3 + Sex, data = NewHRS2010_2018_ByAge)
DT_PScore = tab_model(PScore)
print(DT_PScore)






























