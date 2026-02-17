# Regressão Linear: Método de Mínimos Quadrados Ponderados (MQP)

Este projeto apresenta a aplicação do método de **Mínimos Quadrados Ponderados (MQP)** como solução para a violação da suposição de homocedasticidade em modelos de regressão linear simples. O estudo utiliza dados de preços de venda de casas para demonstrar como a ponderação correta das observações pode levar a estimativas mais precisas e eficientes.

## 🎯 Objetivos do Projeto

* **Tratamento de Heterocedasticidade**: Identificar e corrigir a variância não constante dos erros, garantindo que o modelo atenda às suposições clássicas da regressão.
* **Comparação de Estimadores**: Analisar as diferenças entre os Mínimos Quadrados Ordinários (MQO) e os Mínimos Quadrados Ponderados (MQP).
* **Inferência Estatística**: Validar a significância dos parâmetros do modelo após a correção da variância.

## 📝 Metodologia

O projeto segue um rigoroso fluxo de análise estatística para correção de modelos:

1.  **Ajuste Inicial (MQO)**: Realização da regressão linear simples para identificar padrões nos resíduos.
2.  **Diagnóstico de Heterocedasticidade**: Uso de métodos visuais (gráfico de resíduos vs. valores ajustados) para detectar a presença de variância não constante.
3.  **Cálculo dos Pesos ($w_i$)**:
    * Como a variância é desconhecida, estima-se a função de variância a partir do logaritmo dos resíduos ao quadrado do modelo MQO.
    * O peso é definido como $w_i = 1/\hat{\sigma}_i^2$.
4.  **Ajuste do Modelo MQP**: Reajuste do modelo de regressão utilizando os pesos calculados para estabilizar a variância.



## 📈 Principais Resultados

* **Melhoria do Ajuste**: O método MQP permitiu que as observações com menor variância tivessem maior peso no ajuste, resultando em estimativas de erro padrão mais confiáveis.
* **Significância**: A variável preditora (área útil do imóvel) mostrou-se altamente significativa para explicar o preço de venda em ambos os modelos, mas o MQP ofereceu intervalos de confiança mais precisos.
* **Validação**: Após a aplicação dos pesos, os diagnósticos mostraram uma distribuição de resíduos mais homogênea, atendendo aos requisitos para inferência estatística.

## 🛠️ Tecnologias Utilizadas

* **Linguagem**: R.
* **Bibliotecas**: `tidyverse`, `ggplot2`, `stats`.
* **Documentação**: Relatório técnico e Slides de apresentação em PDF.

## 📁 Estrutura do Repositório

* `Relatório-MQP.pdf`: Documento detalhado com a fundamentação teórica e discussão dos resultados.
* `Slides- Mínimos Quadrados Ponderados (MQP).pdf`: Apresentação visual resumindo os principais conceitos e gráficos do projeto.

---
**Autores:** Brenda Luiza Correa, Paula Liserre Calabrez e Vitória Linda da Silva Oliveira.  
*Projeto desenvolvido para a disciplina de Métodos de Regressão — Unicamp.*
