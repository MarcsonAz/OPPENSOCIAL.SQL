/*
##############################################################################
MARCSON AZEVEDO
PRIMEIRAS COLETAS NO DREMIO
IBGE - PNADC V5- 2021 - POBREZA 
##############################################################################
*/

/* TAMANHO DA POPULACAO UF 11  - ok */
SELECT SUM(V1032) AS pop
FROM "Repositorio Oficial Features".ibge.pnadc.pessoas.anual."visita 5".tabela
WHERE tabela.ANO = 2021 AND tabela.UF = 11


/* TAMANHO DA POPULACAO PARA DENOMINADOR DE POBREZA - UF 11  - ok */
SELECT SUM(percentual_pobreza_ipea_ibge_cepal_denominador) AS pop
FROM "Repositorio Oficial Features".ibge.pnadc.pessoas.anual."visita 5".tabela
WHERE tabela.ANO = 2021 AND tabela.UF = 11

/* PARA UF 11 - POBREZA - ok */
SELECT 
SUM(percentual_pobreza_ipea_ibge_cepal_numerador) AS num, 
SUM(percentual_pobreza_ipea_ibge_cepal_denominador) AS den, 
(SUM(percentual_pobreza_ipea_ibge_cepal_numerador)/ SUM(percentual_pobreza_ipea_ibge_cepal_denominador) ) AS percentual_pobres
FROM "Repositorio Oficial Features".ibge.pnadc.pessoas.anual."visita 5".tabela
WHERE tabela.ANO = 2021 AND tabela.UF = 11

/* PARA UF 32 - POBREZA - por sexo - ok */ 
SELECT 
SUM(percentual_pobreza_ipea_ibge_cepal_numerador) AS num, 
SUM(percentual_pobreza_ipea_ibge_cepal_denominador) AS den, 
(SUM(percentual_pobreza_ipea_ibge_cepal_numerador)/ SUM(percentual_pobreza_ipea_ibge_cepal_denominador) ) AS percentual_pobres
FROM "Repositorio Oficial Features".ibge.pnadc.pessoas.anual."visita 5".tabela
WHERE tabela.ANO = 2021 AND tabela.UF = 32
GROUP BY tabela.V2007

/* BR - POBREZA - 2021 - ok */
SELECT 
SUM(percentual_pobreza_ipea_ibge_cepal_numerador) AS num, 
SUM(percentual_pobreza_ipea_ibge_cepal_denominador) AS den, 
(SUM(percentual_pobreza_ipea_ibge_cepal_numerador)/ SUM(percentual_pobreza_ipea_ibge_cepal_denominador) ) AS percentual_pobres
FROM "Repositorio Oficial Features".ibge.pnadc.pessoas.anual."visita 5".tabela
WHERE tabela.ANO = 2021

/* BR - 0 A 17 - POBREZA - 2021 - ok */
SELECT 
SUM(percentual_pobreza_ipea_ibge_cepal_numerador) AS num, 
SUM(percentual_pobreza_ipea_ibge_cepal_denominador) AS den, 
(SUM(percentual_pobreza_ipea_ibge_cepal_numerador)/ SUM(percentual_pobreza_ipea_ibge_cepal_denominador) ) AS percentual_pobres
FROM "Repositorio Oficial Features".ibge.pnadc.pessoas.anual."visita 5".tabela
WHERE ANO = 2021 AND V2009 BETWEEN 0 AND 17

/* BR - POPULACAO - 2021 - ok */
SELECT ROUND(SUM(V1032))
FROM "Repositorio Oficial Features".ibge.pnadc.pessoas.anual."visita 5".tabela
WHERE tabela.ANO = 2021

/* BR - POPULACAO - AREA - 2021 - ok */
SELECT V1022, ROUND(SUM(V1032)) AS pop
FROM "Repositorio Oficial Features".ibge.pnadc.pessoas.anual."visita 5".tabela
WHERE tabela.ANO = 2021
GROUP BY V1022

/* BR - POPULACAO - SEXO - 2021 - ok */
SELECT V2007, ROUND(SUM(V1032)) AS pop
FROM "Repositorio Oficial Features".ibge.pnadc.pessoas.anual."visita 5".tabela
WHERE tabela.ANO = 2021
GROUP BY V2007

/* BR - POBREZA 2015 - V1 - ok */
SELECT 
SUM(percentual_pobreza_ipea_ibge_cepal_numerador) AS num, 
SUM(percentual_pobreza_ipea_ibge_cepal_denominador) AS den, 
(SUM(percentual_pobreza_ipea_ibge_cepal_numerador)/ SUM(percentual_pobreza_ipea_ibge_cepal_denominador) ) AS percentual_pobres
FROM "Repositorio Oficial Features".ibge.pnadc.pessoas.anual."visita 1".tabela
WHERE tabela.ANO = 2015