


library(tidyverse)
library(ggplot2)
library(MASS)
library(gtsummary)
library(patchwork)


obes <- read.csv("C:/Users/paula/Documents/UNICAMP/2024S1/ME714/ObesityDataSet_raw_and_data_sinthetic.csv")
obes <- slice(obes, 1:498)

#Variável resposta

obes$NObeyesdad <- ifelse(obes$NObeyesdad == "Insufficient_Weight", 
                          "Peso.Insuficiente",
                          ifelse(obes$NObeyesdad == "Normal_Weight", 
                                 "Peso.Normal",
                                 ifelse(obes$NObeyesdad == "Overweight_Level_I", 
                                        "Sobrepeso",
                                        ifelse(obes$NObeyesdad == "Overweight_Level_II",
                                               "Sobrepeso", "Obesidade"))))
obes$NObeyesdad <- factor(obes$NObeyesdad, levels =
                              c("Peso.Insuficiente", "Peso.Normal",
                                "Sobrepeso", "Obesidade"), ordered = T)

#Variavel categorica
obes$MTRANS <- ifelse(obes$MTRANS == "Walking", 1, 
                      ifelse(obes$MTRANS == "Public_Transportation", 2, 
                             ifelse(obes$MTRANS == "Bike", 1, 3 )))
obes$MTRANS <- as.factor(obes$MTRANS)

#Variaveis binárias
obes$family_history_with_overweight <- as.factor(obes$family_history_with_overweight)
obes$family_history_with_overweight <- ifelse(obes$family_history_with_overweight == "yes",
                                              "Sim", "Nao")

obes$FAVC <- as.factor(obes$FAVC)
obes$FAVC <- ifelse(obes$FAVC == "yes", "Sim", "Nao")

obes$SMOKE <- as.factor(obes$SMOKE)
obes$SMOKE <- ifelse(obes$SMOKE == "yes", "Sim", "Nao")

obes$SCC <- as.factor(obes$SCC)
obes$SCC <- ifelse(obes$SCC == "yes", "Sim", "Nao")

obes$Gender <- as.factor(obes$Gender)
obes$Gender <- ifelse(obes$Gender == "Female", "Feminino", "Masculino")

#Variaveis ordinais
obes$FCVC <- factor(obes$FCVC, levels = c(1,2,3), ordered = T)

obes$NCP <- factor(obes$NCP, levels = c(1,3,4), ordered = T)

obes$CAEC <- ifelse(obes$CAEC == "no", "Nao",
                    ifelse(obes$CAEC == "Sometimes", "Ocas",
                           ifelse(obes$CAEC == "Frequently", "Freq", "Sempre")))
obes$CAEC <- factor(obes$CAEC, levels = c("Nao", "Ocas", "Freq", "Sempre"), 
                    ordered = T) 

obes$CH2O <- factor(obes$CH2O, levels = c(1,2,3), ordered = T)

obes$FAF <- factor(obes$FAF,levels = c(0,1,2,3), ordered = T)

obes$TUE <- factor(obes$TUE, levels = c(0,1,2), ordered = T)

obes$CALC <- ifelse(obes$CALC == "no", "Nao",
                    ifelse(obes$CALC == "Sometimes", "Ocas",
                           ifelse(obes$CALC == "Frequently", "Freq", "Sempre")))
obes$CALC <- factor(obes$CALC,levels = c("Nao", "Ocas", "Freq", "Sempre"), 
                    ordered = T)

obes$IMC <- obes$Weight/(obes$Height)^2

glimpse(obes)

# Analise descritiva

obes %>% ggplot(aes(x = IMC)) + 
    geom_histogram(fill = "lightgrey", color = "black") +
    geom_density(alpha = 0.2, fill = "grey") + theme_bw() + 
    xlab("IMC") + ylab("Frequência") + labs(title = "Histograma da Freqência por IMC")

summary(obes$NObeyesdad)
summary(obes$IMC)

obes %>% ggplot(aes(x = Age, y = IMC)) + 
    labs(title = "Gráfico de Dispersão do IMC pela Idade", x = "Idade") +
    geom_point() + theme_bw() + geom_smooth(method = "lm")

s1 <- obes %>% ggplot(aes(x = SMOKE, y = IMC)) + 
    labs(x = "Fumo", y = "IMC") + geom_boxplot() + theme_bw()

s2 <- obes %>% ggplot(aes(x = Gender, y = IMC)) + 
    labs(x = "Gênero", y = "IMC") + geom_boxplot() + theme_bw()

s3 <- obes %>% ggplot(aes(x = family_history_with_overweight, y = IMC)) + 
    labs(x = "Histórico Familiar", y = "IMC") + geom_boxplot() + theme_bw()

s4 <- obes %>% ggplot(aes(x = NCP, y = IMC)) + 
    labs(x = "NCP", y = "IMC") + geom_boxplot() + theme_bw()

s5 <- obes %>% ggplot(aes(x = TUE, y = IMC)) + 
    labs(x = "TUE", y = "IMC") + geom_boxplot() + theme_bw()

s6 <- obes %>% ggplot(aes(x = CALC, y = IMC)) + 
    labs(x = "CALC", y = "IMC") + geom_boxplot() + theme_bw()

s7 <- obes %>% ggplot(aes(x = MTRANS, y = IMC)) + 
    labs(x = "MTRANS", y = "IMC") + geom_boxplot() + theme_bw()

s8 <- obes %>% ggplot(aes(x = CH2O, y = IMC)) + 
    labs(x = "CH2O", y = "IMC") + geom_boxplot() + theme_bw()

(s1 | s2 | s3 | s4) / (s5 | s6 | s7 | s8)

ns1 <- obes %>% ggplot(aes(x = FAVC, y = IMC)) + 
    labs(x = "FAVC", y = "IMC") + geom_boxplot() + theme_bw()

ns2 <- obes %>% ggplot(aes(x = FCVC, y = IMC)) + 
    labs(x = "FCVC", y = "IMC") + geom_boxplot() + theme_bw()

ns3 <- obes %>% ggplot(aes(x = SCC, y = IMC)) + 
    labs(x = "SCC", y = "IMC") + geom_boxplot() + theme_bw()

ns4 <- obes %>% ggplot(aes(x = FAF, y = IMC)) + 
    labs(x = "FAF", y = "IMC") + geom_boxplot() + theme_bw()

ns5 <- obes %>% ggplot(aes(x = CAEC, y = IMC)) + 
    labs(x = "CAEC", y = "IMC") + geom_boxplot() + theme_bw()

(ns1 | ns2 | ns3 ) / (ns4 | ns5) 



#################
#seleção stepwise
#modelo com a idade
modelo_inicial <- polr(NObeyesdad ~ Gender + Age + family_history_with_overweight + 
                           FAVC + FCVC + NCP + CAEC + SMOKE + CH2O + SCC + FAF + 
                           TUE + MTRANS + CALC, data = obes, Hess=TRUE)

#Modelo 1
modelo <- stepAIC(modelo_inicial, direction = "backward")

modelo_final <- polr(NObeyesdad ~ Gender + Age + family_history_with_overweight + 
                         NCP + CAEC + SMOKE + CH2O + FAF, data = obes, Hess=TRUE)

#Modelo 2
modelo_inicial2 <- polr(NObeyesdad ~ Gender + family_history_with_overweight + 
                            FAVC + FCVC + NCP + CAEC + SMOKE + CH2O + SCC + FAF + 
                            TUE + MTRANS , data = obes, Hess=TRUE)

modelo2 <- stepAIC(modelo_inicial2, direction = "backward")

modelo_final2 <- polr(NObeyesdad ~ Gender + family_history_with_overweight + 
                          NCP + CAEC + SMOKE + CH2O + FAF + TUE + MTRANS, 
                      data = obes, Hess=TRUE)

#Modelo 3
modelo_final22 <- polr(NObeyesdad ~ Gender + family_history_with_overweight + 
                           NCP + CAEC + SMOKE + CH2O + FAF + MTRANS, 
                       data = obes, Hess=TRUE)

##Checagem de pressupostos
#1 - Variavel dependente ordinal
#2 - Indenpendencia das obs (sem medidas repetidas)
#3 - Ausencia de multicolinearidade: Multicolinearidade é quando se tem uma 
#    autocorrelação entre variáveis independentes 

m1 <- lm(as.numeric(NObeyesdad) ~ Gender + Age + family_history_with_overweight + 
             NCP + CAEC + SMOKE + CH2O + FAF, obes)
car::vif(m1)


m2 <- lm(as.numeric(NObeyesdad) ~ Gender + family_history_with_overweight +
             NCP + CAEC + SMOKE + CH2O + FAF + TUE + MTRANS, obes)
car::vif(m2)

m3 <- lm(as.numeric(NObeyesdad) ~ Gender + family_history_with_overweight + 
             NCP + CAEC + SMOKE + CH2O + FAF + MTRANS, obes)
car::vif(m3)

m3 <- lm(as.numeric(NObeyesdad) ~ Gender + family_history_with_overweight + 
             NCP + CAEC + SMOKE + CH2O + FAF + MTRANS, obes)
car::vif(m3)

#Multicolineariedade: VIF (Fator de inflação) > 10
#Modelos apresentam ausência de multicolineariedade: todos perto de 1

#4 - Chances proporcionais
#H0: CHANCES SÃO PROPORCIONAIS
car::poTest(modelo_final)
#Idade < 0.05
#Overall = 0.03

car::poTest(modelo_final2)
car::poTest(modelo_final22)

#Efeitos globais do modelo: avaliar efeito das var. ind na var dep.

car::Anova(modelo_final2, type = "II", test = "Wald" )

#TUE NÃO SIGNIFICATIVA

car::Anova(modelo_final22, type = "II", test = "Wald" )

#EFEITOS ESPECIFICOS
lmtest::coeftest(modelo_final2)

lmtest::coeftest(modelo_final22)


#Interpretar coeficiente por:
#Razão de chance com IC 95% (usando log-likelihood)
exp(cbind(OR = coef(modelo_final2), confint(modelo_final2)))
#não interpetar coef não sig
#razão de chances = 1 indica não significancia
#observar ic do calc - muito grande

#interpretação genero: Feminino como referência, ser homem esta associado a uma 
#chance 0.5473 maior do que ser mulher (chance de responder a uma categoria mais 
#alta da nossa variavel dependente)


ctable <- coef(summary(modelo_final22))
p <- pnorm(abs(ctable[,"t value"]), lower.tail = F)*2
ctable <- as.data.frame(round(cbind(ctable, "p value" = p), 4))

ctable

summary(modelo_final22)

gtsummary::tbl_regression(modelo_final22, exponentiate = TRUE,
                          estimate_fun = purrr::partial(style_ratio, digits = 3), 
                          pvalue_fun = purrr::partial(style_sigfig, digits = 4)) %>% 
    gtsummary::add_global_p()

