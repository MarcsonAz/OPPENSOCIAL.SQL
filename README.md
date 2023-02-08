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

TESTE 1 - ... sabe ler e escrever? V1

SELECT V3001, ROUND(SUM(V1032)) AS pop
FROM "Repositorio Oficial Features".ibge.pnadc.pessoas.anual."visita 1".tabela
WHERE tabela.ANO = 2019
GROUP BY V3001
- 15.186.206


TESTE 1 - ... sabe ler e escrever? V5

SELECT V3001, ROUND(SUM(V1032)) AS pop
FROM "Repositorio Oficial Features".ibge.pnadc.pessoas.anual."visita 5".tabela
WHERE tabela.ANO = 2019
GROUP BY V3001

- 15.589.414

DESAFIO - TAXA DE ANALFABETISMO - > 15 ANOS -

TESTE 2 - ... sabe ler e escrever? V1

SELECT V3001, ROUND(SUM(V1032))/1000 AS pop
FROM "Repositorio Oficial Features".ibge.pnadc.pessoas.anual."visita 1".tabela
WHERE tabela.ANO = 2019 AND tabela.V2009 >= 15
GROUP BY V3001

V3001	pop
1	154942.441
2	10387.385

TESTE 2 - ... sabe ler e escrever? V5

SELECT V3001, ROUND(SUM(V1032))/1000 AS pop
FROM "Repositorio Oficial Features".ibge.pnadc.pessoas.anual."visita 5".tabela
WHERE tabela.ANO = 2019 AND tabela.V2009 >= 15
GROUP BY V3001

V3001	pop
2	11035.535
1	157008.47

TESTE 2 - ... sabe ler e escrever? V5 - 2016

SELECT V3001, ROUND(SUM(V1032))/1000 AS pop
FROM "Repositorio Oficial Features".ibge.pnadc.pessoas.anual."visita 5".tabela
WHERE tabela.ANO = 2019 AND tabela.V2009 >= 15
GROUP BY V3001


TESTE 3 - V1 2019 com derivadas - VD3004 e VD3005

SELECT VD3004, ROUND(SUM(V1032))/1000 AS pop
FROM "Repositorio Oficial Features".ibge.pnadc.pessoas.anual."visita 1".tabela
WHERE tabela.ANO = 2019 AND tabela.V2009 >= 15
GROUP BY VD3004
- 




DEFINICAO ANALFABETO

eh analfabeto - 15 anos ou mais e não sabe ler ou escrever
nao eh analfabeto - 15 anos ou mais e sabe ler e escrever
nao conta - nao respondeu se sabe ler ou escrever ou tem menos de 15 anos


ANALFABETOS POR ANO
POR REGIAO



calcular o numerador e denominador do 

percentual de analfabetos


por regiao e por ano




criar o percentual

numerador = analfabeto * V1032
denominador = total_analfabeto * V1032


3 view no 4 junta

1 - serie, 2012 a 2019 v1 e 2020 e 2021 v5
2 - v1
3 - v5



2012 - 10-20 30-40 50-60 80-90
2013 - 10-20 30-40 50-60 80-90
2014 - 10-20 30-40 50-60 80-90
2015 - 10-20 30-40 50-60 80-90
2016 - 10-20 30-40 50-60 80-90


### alfabetização

definir as gerações a partir dos anos de nascimento

gráfico ao longo dos anos 
gráficos ao longo das idades



#################### 
POBREZA
#################### 

COLOCAR TODOS OS INDICADORES NO 3 AGREGA DE CADA BASE
VALIDAR AMOSTRA > 100 - FAZER PLANILHA COM GRUPOS PARA CADA GRANULARIDADE - BR, GR E UF
CRIAR O ENTREGAVEL PAINEL

#################### 
POBREZA
#################### 


#################### 
DESAFIO ANALFABETISMO
#################### 

REVISAR GERACAO
CRIAR ENTREGAVEL
PRENDER A TABELA DINAMICA
CRIAR GRAFICOS

definir as gerações a partir dos anos de nascimento

gráfico ao longo dos anos 
gráficos ao longo das idades


#################### 
DESAFIO ANALFABETISMO
#################### 



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

SUM(V1032) AS numero_pessoas,
COUNT(*) AS numero_observacoes

FROM "Imds Projetos"."pobreza criancas adolescentes onda 1 magnitude"."- PNADC Anual Visita 5"."2 features".tabela

GROUP BY 
ano,regiao_descricao,regiao,uf_descricao,uf_descricao_mapa,uf_sigla,uf,raca_cor,rural_urbana,sexo,
faixa_etaria1, faixa_etaria2,faixa_etaria3,faixa_etaria4,faixa_etaria5


