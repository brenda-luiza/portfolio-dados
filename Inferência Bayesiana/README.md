# Análise Bayesiana do Desempenho Acadêmico via Amostrador de Gibbs

Este projeto aplica técnicas de inferência Bayesiana para investigar os fatores que influenciam o desempenho acadêmico de estudantes. Utilizou-se um modelo de **Regressão Linear Múltipla** ajustado através do **Amostrador de Gibbs**, um método de Markov Chain Monte Carlo (MCMC).

## 📝 Introdução e Metodologia

Com o objetivo de avaliar a influência de diversos fatores no desempenho dos alunos, ajustou-se um modelo de Regressão Linear Múltipla utilizando o Amostrador de Gibbs. Este é um método de MCMC usado para estimar distribuições posteriores em modelos bayesianos, funcionando através da amostragem sequencial a partir das distribuições condicionais completas de cada parâmetro, visando garantir que as cadeias MCMC atinjam uma distribuição estacionária.

### Modelo Estatístico
O modelo considera a relação entre o desempenho e as seguintes variáveis:
* **Horas Estudadas**
* **Pontos Anteriores**
* **Atividades Extras** (Variável binária)
* **Horas de Sono**
* **Número de Questionários**

## 🎯 Objetivos

* **Identificar Influências**: Analisar como cada variável preditora afeta a pontuação final de desempenho.
* **Estimação Bayesiana**: Utilizar o Amostrador de Gibbs para estimar os coeficientes ($\beta$) e a variância ($\sigma^2$).
* **Validação de Convergência**: Avaliar se as cadeias atingiram a distribuição estacionária para garantir estimativas precisas.

## 📈 Resultados e Diagnósticos

* **Convergência**: A análise dos *trace plots* (gráficos de linha) após o período de *burn-in* demonstrou que as cadeias são estacionárias, com média e variância constantes.
* **Ajuste do Modelo**: O modelo apresentou um coeficiente de determinação **$R^2$ próximo de 0.99**, indicando um ajuste extremamente alto aos dados observados.
* **Significância**: Os intervalos de credibilidade para os coeficientes $\beta$ não incluem o zero, confirmando que as variáveis preditoras possuem efeito significativo no desempenho.
* **Análise de Resíduos**: Histogramas e gráficos QQ-Plot foram utilizados para validar as suposições do modelo linear após a estimação bayesiana.

## 🛠️ Tecnologias Utilizadas

* **Linguagem**: R
* **Bibliotecas**: `tidyverse`, `coda`, `MASS`, `MCMCpack`, `ggplot2`
* **Documentação**: R Markdown e LaTeX para o poster acadêmico.

## 📁 Estrutura do Repositório

* `codigo_mcmc.Rmd`: Implementação completa do algoritmo, carregamento de dados e geração de diagnósticos.
* `poster_mcmc.pdf`: Apresentação visual consolidada dos métodos e resultados finais.
* `Student_Performance.csv`: Base de dados com 10.000 registros de alunos.

---
**Autores:** Brenda Luiza Correa, Vitória Linda da Silva Oliveira e Paula Liserre Calabrez.  
*Projeto desenvolvido para a disciplina ME705 - Unicamp.*
