# Análise Numérica: A Maldição da Dimensionalidade

Este projeto apresenta uma exploração estatística e computacional sobre o fenômeno conhecido como "Maldição da Dimensionalidade". Através de simulações numéricas, o estudo demonstra como o aumento do número de dimensões (variáveis) afeta a densidade dos dados, a distribuição de distâncias e a performance de algoritmos de aprendizado de máquina.

## 🎯 Objetivos do Projeto

* **Simulação de Espaços Hiperdimensionais**: Visualizar e quantificar o comportamento de volumes e distâncias à medida que a dimensão $d$ aumenta.
* **Análise de Distâncias**: Demonstrar a convergência das distâncias entre pontos em altas dimensões, o que torna a diferenciação entre vizinhos próximos e distantes irrelevante.
* **Impacto em Modelos de ML**: Avaliar como o aumento de dimensões exige um crescimento exponencial na quantidade de dados para manter a mesma representatividade (esparsidade).

## 📝 Metodologia e Simulações

O projeto utiliza simulações de Monte Carlo implementadas em R para ilustrar três aspectos fundamentais:

1.  **Volume da Hiperesfera vs. Hipercubo**: Demonstração de que, conforme $d \to \infty$, o volume da hiperesfera inscrita em um hipercubo tende a zero, indicando que a maior parte da massa de dados se concentra nos "cantos" do espaço.
2.  **Distribuição de Distâncias Euclidianas**: Simulação de pontos distribuídos uniformemente para observar o fenômeno onde a diferença entre a distância mínima e máxima entre pontos torna-se insignificante em relação à distância média.
3.  **Densidade de Dados**: Cálculo da quantidade necessária de observações para preencher o espaço de forma que cada ponto tenha vizinhos próximos, evidenciando o crescimento exponencial da necessidade de dados.



## 📈 Principais Insights

* **Esparsidade**: Em altas dimensões, os dados tornam-se extremamente esparsos, o que pode levar ao *overfitting* em modelos que dependem de vizinhança, como o k-NN.
* **Instabilidade de Distâncias**: A métrica de distância euclidiana perde seu poder discriminatório, afetando algoritmos de agrupamento (clustering) e classificação.
* **Redução de Dimensionalidade**: O estudo reforça a necessidade de técnicas como PCA ou seleção de atributos para mitigar esses efeitos em problemas reais de Ciência de Dados.

## 🛠️ Tecnologias Utilizadas

* **Linguagem**: R.
* **Bibliotecas**: `tidyverse`, `ggplot2`, `gridExtra`, `plotly`.
* **Formatos**: R Markdown (`.Rmd`) e relatório final em HTML.

## 📁 Estrutura do Repositório

* `Codigo_curse_of_dimensionality.Rmd`: Script R Markdown com toda a lógica de simulação e geração de gráficos.
* `Relatório_curse_of_dimensionality.html`: Relatório técnico compilado com as interpretações teóricas e visuais dos resultados.

---
**Autores:** Brenda Luiza Correa, Paula Liserre Calabrez e Vitória Linda da Silva Oliveira.  
*Projeto desenvolvido para o estudo de fundamentos de Machine Learning e Estatística.*
