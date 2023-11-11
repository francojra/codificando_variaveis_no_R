
# Codificando variáveis categóricas --------------------------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data: 10/11/23 ---------------------------------------------------------------------------------------------------------------------------
# Referência: https://www.youtube.com/watch?v=0afvtQyTxjc ----------------------------------------------------------------------------------

# O que vamos aprender? --------------------------------------------------------------------------------------------------------------------

### - Configurar variáveis categóricas nominais
### - Configurar variáveis categóricas ordinais
### - Rotular categorias
### - Codificar valores ausentes

# Alguns exemplos --------------------------------------------------------------------------------------------------------------------------

### Gênero

0 <- masculino
1 <- feminino

### Grau de escolaridade

0 <- fundamental
1 <- medio
3 <- superior

# Pacotes ----------------------------------------------------------------------------------------------------------------------------------

library(dplyr)

# Carregar dados ---------------------------------------------------------------------------------------------------------------------------

dados <- read.csv('Banco de Dados 2 Codificado.csv', sep = ';', dec = ',', check.names = F)

# Visualizando o banco de dados ------------------------------------------------------------------------------------------------------------

View(dados)
glimpse(dados) # Mostra todas as variávies como números inteiros

# Ajustando as variáveis -------------------------------------------------------------------------------------------------------------------

### Codificando a variável gênero de inteiro para categórico (fator)

dados$Genero <- factor(dados$Genero, levels = c(0,1), labels = c("M", "F"))

### Codificando a variável grau de instrução de inteiro para categórico (fator)

dados$Grau_de_Instrucao <- factor(dados$Grau_de_Instrucao,
                                  labels = c("Fundamental", "Medio", "Superior"),
                                  levels = 0:2, order = T)
##### O argumento 'order' é importante para definir a variável como categórica
##### ordinal, ou seja, que existe uma ordem na variável.

### Codificando valores ausentes (missing values)

dados[dados == -999] <- NA