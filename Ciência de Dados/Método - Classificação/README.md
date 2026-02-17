# Modelo de Classificação: Predição de Renda Anual (>50K)

Este trabalho utiliza o dataset do Kaggle – Salary Prediction Classification[https://www.kaggle.com/datasets/ayessa/salary-prediction-classification/data], com informações socioeconômicas e demográficas de indivíduos, para prever se uma pessoa pertence à faixa de renda >50K.

O modelo desenvolvido, em um cenário real de um banco, permite identificar clientes com alta renda e direcionar produtos exclusivos apenas para quem tem perfil >50K, aumentando a eficiência e reduzindo custos. Além disso, ajuda na gestão de risco de crédito, prevenindo inadimplência e permitindo aprovações automáticas de limites com base na renda prevista. Por fim, possibilita personalizar a experiência do cliente, oferecendo produtos no momento certo e evitando que clientes valiosos migrem para a concorrência, fortalecendo retenção e oportunidades de cross-selling.

## 🎯 Objetivos do Projeto

* **Classificação**: Diferenciar indivíduos com renda `<=50K` de indivíduos com renda `>50K`.
* **Pipeline de Dados**: Implementar transformações automatizadas, como padronização de escalas e codificação de variáveis categóricas.
* **Otimização de Modelos**: Comparar diferentes algoritmos utilizando validação cruzada para garantir a estabilidade das métricas de desempenho.

## 🏗️ Arquitetura da Solução

O fluxo de trabalho foi estruturado utilizando a biblioteca `scikit-learn` em Python:

1.  **Tratamento de Dados**:
    * Limpeza de valores ausentes e tratamento de variáveis categóricas.
    * Padronização de variáveis numéricas, como idade e ganho de capital.
2.  **Modelos Avaliados**: Comparação via validação cruzada (K-Fold Estratificado) de quatro algoritmos:
    * **Logistic Regression**: Atuou como modelo base (*baseline*); embora estável, sua natureza linear limitou a captura de relações complexas (Acc: 83.99%).
    * **SVC (Support Vector Classifier)**: Buscou o hiperplano de separação máxima, beneficiando-se da padronização de escalas (Acc: 85.17%).
    * **Random Forest**: Método de *Ensemble* (Bagging) que reduziu o sobreajuste ao combinar múltiplas árvores independentes (Acc: 86.02%).
    * **Gradient Boosting (GBC)**: O **modelo vencedor**; constrói árvores sequencialmente para corrigir erros residuais, capturando interações sutis entre os dados (Acc: 86.37%).
3.  **Métricas de Avaliação**:
    * **Acurácia e F1-Score**: Para medir a precisão e o equilíbrio entre sensibilidade e especificidade.
    * **Matriz de Confusão e Curva ROC**: Diagnóstico detalhado das predições.



## 📈 Principais Resultados

O modelo de **Gradient Boosting** superou os demais em termos de acurácia e equilíbrio de classificação (F1-Score).

### Desempenho dos Modelos (Validação Cruzada)
| Modelo | Acc Média | F1 Média | Std |
| :--- | :---: | :---: | :---: |
| **GradientBoostingClassifier** | **86.37%** | **85.75%** | **0.005** |
| RandomForestClassifier | 86.02% | 85.28% | 0.003 |
| SVC | 85.17% | 84.50% | 0.004 |
| LogisticRegression | 83.99% | 83.44% | 0.002 |

### 🧪 Performance no Conjunto de Teste (Dados Não Observados)

Os resultados mostram que o modelo foi bem ajustado. A acurácia no treino (86,99%) e no teste (86,28%) são próximas, o que indica que não houve overfitting — ou seja, o modelo não decorou os dados, ele aprendeu padrões que generalizam bem para novos dados.

O modelo tem desempenho diferente entre as classes:

* Para a classe ≤50K, ele apresenta precisão de 88% e recall de 95%, resultando em um F1-score de 0,91. Isso acontece porque essa é a classe majoritária (4531 casos), então o modelo tem mais exemplos para aprender.
* Para a classe >50K (1502 casos), a precisão é 79%, o que significa que, quando o modelo prevê alta renda, ele geralmente está correto. Porém, o recall é 61%, indicando que ele deixa passar parte das pessoas que realmente ganham mais de 50K.

* **Curva ROC**: O modelo apresentou um valor de **AUC de aproximadamente 0.92**, confirmando uma excelente capacidade discriminatória entre as classes de renda.
  
### Perfil de Alta Renda (Feature Importance)
O modelo identificou que os fatores com maior impacto na probabilidade de renda >50K são:
1.  **Estado Civil**: Forte correlação positiva para indivíduos casados.
2.  **Educação**: Níveis de escolaridade mais altos elevam significativamente a chance de alta renda.
3.  **Idade e Carga Horária**: A experiência profissional e o tempo dedicado ao trabalho semanal são determinantes.
4.  **Investimentos**: Ganhos de capital recorrentes são preditores fundamentais.

## 🛠️ Tecnologias Utilizadas

* **Linguagem**: Python.
* **Bibliotecas**: `pandas`, `scikit-learn`, `matplotlib`, `seaborn`.
* **Ambiente**: Jupyter Notebook / Google Colab.

## 📁 Estrutura do Repositório

* `Modelo de classificação - Machine Learning.ipynb`: Notebook com o código e análise exploratória.
* `Modelo de classificação - Machine Learning.html`: Relatório final compilado com as visualizações e métricas.
* `salary.csv`: Banco de dados utilizado para o trabalho.

---
*Projeto desenvolvido para o estudo de algoritmos de aprendizado supervisionado e interpretação de modelos de Ensemble.*
