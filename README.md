# OPPENSOCIAL.SQL
Queries para gerar Views no Dremio da Oppen - treinamento Oppen Social - fev23


## 06/02 - Primeiro Dia
Conhecer estrutura de trabalho oppen física e estrategicamente.
Acessar o Dremio, identificar espaços os quais tenho acesso
Criar as minhas primeiras Views - consultas avulsas
Entender o plano do treinamento

### Plano do Treinamento

##### Construir o material para um .pbix de pobreza 
Menos complexa e perto do meu domínio de indicadores e base de dados, foca será em aprender a estrutura de trabalho

#### Construir o material para....
Mais complexo para evoluir na construção de projetos


## 07/02 - Segundo Dia
Subir repositório no Github e concluir os scripts em SQL para as views iniciais de consultas avulsas 

TRATAMENTOS PROJETO ANALFABETOS

DESAFIO - TAXA DE ANALFABETISMO - > 
TESTES EM 2019 PARA COMPARAR COM PUBLICACAO DO IBGE
https://educa.ibge.gov.br/jovens/conheca-o-brasil/populacao/18317-educacao.html#:~:text=Um%20dado%20importante%20sobre%20educa%C3%A7%C3%A3o,(11%20milh%C3%B5es%20de%20analfabetos).

*** Revisar o tratamnto do material de analfbetismo ***

## 08/02 - Terceiro Dia

PROJETO POBREZA - DASHBOARD MAGNITUDE DA POBREZA

Objetivo de construir a estrutura e calcular os indicadores do painel da onda 1 de pobreza

As views do projeto estão na pasta do projeto

Calculados os indicadores, foram construídos dois entregáveis:
    uma tabela dinâmica com todos os dados para verificação dos resultados e para a análise da amotra que será realizada posteriormente
    (foi aberta a categoria de cor ou raça)

    um painel de indicadores com as especificações


## 09/02 - Quarto Dia

PROJETO POBREZA - DASHBOARD MAGNITUDE DA POBREZA

Validação dos dados, atualização de detalhes no painel de indicadores

PROJETO POBREZA - DASHBOARD CONDIÇÕES PARA O DESENVOLVIMENTO DE HABILIDADES

Compreensão dos materiais de apoio e do resultado desejado
Estruturação do projeto no Dreamio
Início do cálculo de indicadores


## 10/02 - Quinto Dia

Atualização do github com mais textos de apoio e construção da estrutura dos projetos de pobreza aplicada no Dremio

PROJETO POBREZA - DASHBOARD CONDIÇÕES PARA O DESENVOLVIMENTO DE HABILIDADES

Compreensão dos materiais de apoio e do resultado desejado
Estruturação do projeto no Dreamio
Início do cálculo de indicadores









### retomada da discussao de alfabetização

definir as gerações a partir dos anos de nascimento

gráfico ao longo dos anos 
gráficos ao longo das idades


REVISAR GERACAO
CRIAR ENTREGAVEL
PRENDER A TABELA DINAMICA
CRIAR GRAFICOS

definir as gerações a partir dos anos de nascimento

gráfico ao longo dos anos 
gráficos ao longo das idades


### detalhes dashboard pobreza

COLOCAR TODOS OS INDICADORES NO 3 AGREGA DE CADA BASE
VALIDAR AMOSTRA > 100 - FAZER PLANILHA COM GRUPOS PARA CADA GRANULARIDADE - BR, GR E UF
CRIAR O ENTREGAVEL PAINEL



### SQL

/*
agrupar por ano, regiao, uf, raca, sexo e faixas etarias 
ano	regiao_descricao	regiao	uf_descricao	uf_descricao_mapa	uf_sigla	uf	raca_cor	rural_urbana	sexo	faixa_etaria1	faixa_etaria2	faixa_etaria3	faixa_etaria4	faixa_etaria5
*/

SELECT 
ano,regiao_descricao,regiao,uf_descricao,uf_descricao_mapa,uf_sigla,uf,raca_cor,rural_urbana,sexo,
faixa_etaria1, faixa_etaria2,faixa_etaria3,faixa_etaria4,faixa_etaria5,

SUM(percentual_extrema_pobreza_ipea_ibge_cepal_numerador) AS percentual_ipea_ibge_cepal_extrema_pobreza_numerador,
SUM(percentual_extrema_pobreza_ipea_ibge_cepal_denominador) AS percentual_ipea_ibge_cepal_extrema_pobreza_denominador,

SUM(percentual_pobreza_ipea_ibge_cepal_numerador) AS percentual_ipea_ibge_cepal_pobreza_numerador,
SUM(percentual_pobreza_ipea_ibge_cepal_denominador) AS percentual_ipea_ibge_cepal_pobreza_denominador,

SUM(hiato_extrema_pobreza_ipea_ibge_cepal_nao_normalizado_numerador) AS hiato_ipea_ibge_cepal_extrema_pobreza_numerador,
SUM(hiato_extrema_pobreza_ipea_ibge_cepal_nao_normalizado_denominador) AS hiato_ipea_ibge_cepal_extrema_pobreza_denominador,

SUM(V1032) AS peso_pessoas,
COUNT(*) AS numero_observacoes

FROM "Imds Projetos"."pobreza criancas adolescentes onda 1 magnitude"."- PNADC Anual Visita 5"."2 features".tabela

GROUP BY 
ano,regiao_descricao,regiao,uf_descricao,uf_descricao_mapa,uf_sigla,uf,raca_cor,rural_urbana,sexo,
faixa_etaria1, faixa_etaria2,faixa_etaria3,faixa_etaria4,faixa_etaria5


