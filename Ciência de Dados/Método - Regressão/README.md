# Análise e Predição do Desempenho Educacional (UK Education Dataset)

Este projeto utiliza técnicas de ciência de dados e aprendizado de máquina para analisar e prever o desempenho educacional em cidades inglesas. Utilizando o conjunto de dados *education* do **UK Office for National Statistics (ONS)**, o trabalho explora como fatores socioeconômicos e demográficos influenciam a pontuação educacional (`education_score`) das localidades.

## 🎯 Objetivos do Projeto

* **Identificar Preditores-Chave**: Determinar quais fatores socioeconômicos mais impactam o desempenho acadêmico.
* **Modelagem Preditiva**: Desenvolver e comparar modelos de regressão para estimar o `education_score`.
* **Análise de Generalização**: Avaliar a capacidade do modelo em prever dados não observados durante o treinamento.

## 🏗️ Arquitetura da Solução

O projeto foi estruturado em um fluxo de trabalho completo de Ciência de Dados:

1.  **Tratamento de Dados**:
    * Prevenção de *Data Leakage* através da remoção de variáveis que compunham diretamente o alvo.
    * Tratamento de multicolinearidade (removendo variáveis com correlação $|r| > 0.7$).
    * Limpeza de valores ausentes (remoção da variável `activity_at_age_19_out_of_work`).
2.  **Modelos Avaliados**:
    * **Regressão Linear Múltipla (LM)**.
    * **Elastic Net (GLMnet)**: Melhor desempenho, equilibrando penalidades L1 e L2.
    * **Random Forest (RF)**: Técnica de *ensemble* com 500 árvores.
    * **Boosting (GBM)**: Ajuste sequencial de estimadores fracos.

## 📈 Principais Resultados

O modelo selecionado foi o **GLMnet**, que demonstrou alta capacidade preditiva e estabilidade.

### Desempenho do Modelo Final
| Conjunto | RMSE | R-Squared ($R^2$) | MAE |
| :--- | :---: | :---: | :---: |
| **Treino** | 1.1444 | 0.8118 | 0.8983 |
| **Teste** | 1.0506 | 0.8291 | 0.8256 |
*(Valores baseados nos resultados do relatório final)*

### Variáveis Mais Influentes
A análise de importância de variáveis revelou que o desempenho educacional é majoritariamente guiado por:
1.  **Ensino Superior**: Taxa de jovens de 19 anos em educação integral.
2.  **Fatores Econômicos**: Nível de privação de renda da localidade.
3.  **Contexto Familiar**: Nível de qualificação dos residentes adultos (35-64 anos).

## 🛠️ Tecnologias e Dependências

O projeto foi desenvolvido em linguagem **R** utilizando as seguintes bibliotecas:
* `tidyverse` (Manipulação de dados)
* `caret` (Treinamento de modelos e validação cruzada)
* `glmnet` (Algoritmos de regularização)
* `ggplot2` (Visualização de dados)
* `kableExtra` (Formatação de tabelas)

## 📁 Estrutura do Repositório

* `codigo-metodo-regressao.Rmd`: Script principal com a análise e modelagem.
* `education.rda`: Conjunto de dados utilizado (necessário para execução).
* `referencias.bib`: Arquivo de bibliografia das citações acadêmicas.

---
*Projeto realizado como parte da Atividade 03 da disciplina de Métodos de Supervisionados.*
