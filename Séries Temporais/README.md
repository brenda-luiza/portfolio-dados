# Relatórios de Análise de Séries Temporais

Este repositório contém uma coletânea de quatro estudos estatísticos aplicados a diferentes fenômenos temporais, desenvolvidos para a disciplina de Séries Temporais (Unicamp).

## 📁 Projetos Incluídos

O relatório consolidado abrange os seguintes estudos de caso:

### 1. Atividade de Manchas Solares (Sunspots)
* **Objetivo**: Analisar o comportamento cíclico da atividade solar.
* **Metodologia**: Estudo de séries com oscilações não lineares e identificação de ciclos de longo prazo.
* **Destaque**: Uso de modelos autorregressivos para capturar a periodicidade solar.

### 2. Níveis de Poluição Atmosférica
* **Objetivo**: Investigar a variação de poluentes ao longo do tempo e sua estrutura de dependência.
* **Metodologia**: Modelagem de tendências e análise de autocorrelação residual.

### 3. Índice de Preços de Commmodities
* **Objetivo**: Analisar a volatilidade e a tendência em séries financeiras de commodities.
* **Metodologia**: Aplicação de diferenciações para estabilização de séries não estacionárias.

### 4. Produção de Energia Elétrica (Turquia)
* **Objetivo**: Modelar a produção mensal de energia elétrica entre 1970 e 2024.
* **Metodologia**: Ajuste de modelos **SARIMA$(0,1,1) \times (0,1,1)_{12}$**.
* **Destaque**: Aplicação da **Transformação de Box-Cox** ($\lambda = 0.28$) para estabilizar a variância e tratamento de sazonalidade anual.

## 📝 Metodologia Geral Aplicada

Para todos os projetos, seguiu-se o rigoroso fluxo estatístico:
1.  **Análise Descritiva**: Visualização da série, FAC e FACP para identificação de padrões.
2.  **Estacionariedade**: Uso de transformações de potência e diferenciações (ordinárias e sazonais).
3.  **Identificação e Estimação**: Seleção de modelos via critérios AIC/BIC.
4.  **Diagnóstico Residual**: Testes de Ljung-Box para verificação de ruído branco e análise de normalidade.
5.  **Previsão**: Geração de estimativas futuras com intervalos de confiança.



## 🛠️ Tecnologias Utilizadas

* **Linguagem**: R
* **Pacotes Principais**: `tseries`, `forecast`, `MASS`, `ggplot2`
* **Documentação**: Relatório técnico em PDF
