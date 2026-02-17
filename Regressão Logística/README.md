# Análise de Fatores Associados aos Níveis de Obesidade via Regressão Logística Ordinal

Este projeto apresenta um estudo estatístico inferencial sobre os fatores que influenciam os níveis de obesidad. O objetivo é a **compreensão das relações e associações** entre hábitos de vida, características demográficas e a progressão das categorias de peso corporal.

## 🎯 Objetivos do Projeto

* **Análise Descritiva**: Identificar quais fatores (alimentares, físicos e demográficos) possuem associação com o aumento dos níveis de obesidade através de gráficos.
* **Modelagem**: Aplicar o modelo de Regressão Logística Ordinal Politômica.
* **Quantificação de Riscos**: Utilizar Razões de Chance (*Odds Ratio*) para medir o impacto de cada variável na probabilidade de um indivíduo pertencer a uma categoria de peso superior.


## 📝 Metodologia

A abordagem seguiu os princípios da análise de dados discretos para modelos ordinais:

1.  **Tratamento de Dados**:
    * Reclassificação da variável resposta para garantir categorias ordenadas consistentes (Peso Insuficiente < Peso Normal < Sobrepeso < Obesidade).
    * Agrupamento de níveis de sobrepeso para aumentar a robustez estatística das estimativas.
2.  **Modelagem Estatística**:
    * Ajuste do **Modelo de Logit Acumulado (Chances Proporcionais)** através da função `polr` do pacote `MASS`.
    * Seleção de variáveis baseada no método **Stepwise** e no Critério de Informação de Akaike (AIC) para encontrar o modelo que melhor descreve a estrutura dos dados.
3.  **Validação de Suposições**:
    * Verificação da suposição de **chances proporcionais** (paralelismo), fundamental para modelos ordinais.
    * Análise de multicolinearidade através do VIF (*Variance Inflation Factor*).



## 📈 Principais Achados Inferenciais

* **Associação por Gênero**: Observou-se que indivíduos do sexo masculino apresentam chances significativamente maiores de estarem em níveis de obesidade mais elevados em comparação ao sexo feminino nesta amostra.
* **Padrões Alimentares**: O consumo frequente de alimentos calóricos (FAVC) e a frequência de consumo de vegetais (FCVC) mostraram-se fatores decisivos associados à mudança de categoria de peso.
* **Comportamento e Tecnologia**: O tempo de uso de dispositivos tecnológicos (TUE) e a frequência de atividade física (FAF) apresentaram associações claras com a condição física dos indivíduos analisados.

## 🛠️ Tecnologias Utilizadas

* **Linguagem**: R
* **Bibliotecas**: `tidyverse`, `MASS`, `car`, `gtsummary`, `lmtest`
* **Documentação**: Relatório técnico em PDF

## 📁 Estrutura do Repositório

* `Codigo_regressao_logistica.R`: Script com a rotina de análise, testes de hipóteses e construção de tabelas inferenciais.
* `Relatório_regressao_logistica.pdf`: Relatório completo com fundamentação teórica, interpretação dos coeficientes e discussão dos resultados.
* `Dados_obesidade.csv`: Base de dados utilizada no estudo.

---
**Autores:** Vitória Linda da Silva Oliveira, Brenda Luiza Correa e Paula Liserre Calabrez.  
*Estudo desenvolvido para a disciplina de Análise de Dados Discretos (ME714) — Unicamp.*
