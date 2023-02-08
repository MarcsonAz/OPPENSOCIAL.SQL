
SELECT *,
ANO AS ano,

/* DEFINIR VARIAVEIS DE LOCALIZACAO */
/* REGIAO, UF, RURAL URBANO */

CASE 
    WHEN UF LIKE '1_' THEN 1
    WHEN UF LIKE '2_' THEN 2
    WHEN UF LIKE '3_' THEN 3
    WHEN UF LIKE '4_' THEN 4
    WHEN UF LIKE '5_' THEN 5
    ELSE NULL
END AS regiao,

CASE 
    WHEN UF LIKE '1_' THEN 'Norte'
    WHEN UF LIKE '2_' THEN 'Nordeste'
    WHEN UF LIKE '3_' THEN 'Sudeste'
    WHEN UF LIKE '4_' THEN 'Sul'
    WHEN UF LIKE '5_' THEN 'CentroOeste'
    ELSE NULL
END AS regiao_descricao,

UF AS uf,

CASE
    WHEN UF = 11 THEN 'RO'
    WHEN UF = 12 THEN 'AC'
    WHEN UF = 13 THEN 'AM'
    WHEN UF = 14 THEN 'RR'
    WHEN UF = 15 THEN 'PA'
    WHEN UF = 16 THEN 'AP'
    WHEN UF = 17 THEN 'TO'
    WHEN UF = 21 THEN 'MA'
    WHEN UF = 22 THEN 'PI'
    WHEN UF = 23 THEN 'CE'
    WHEN UF = 24 THEN 'RN'
    WHEN UF = 25 THEN 'PB'
    WHEN UF = 26 THEN 'PE'
    WHEN UF = 27 THEN 'AL'
    WHEN UF = 28 THEN 'SE'
    WHEN UF = 29 THEN 'BA'
    WHEN UF = 31 THEN 'MG'
    WHEN UF = 32 THEN 'ES'
    WHEN UF = 33 THEN 'RJ'
    WHEN UF = 35 THEN 'SP'
    WHEN UF = 41 THEN 'PR'
    WHEN UF = 42 THEN 'SC'
    WHEN UF = 43 THEN 'RS'
    WHEN UF = 50 THEN 'MS'
    WHEN UF = 51 THEN 'MT'
    WHEN UF = 52 THEN 'GO'
    WHEN UF = 53 THEN 'DF'
    ELSE NULL
END AS uf_sigla,

CASE
    WHEN UF = 11 THEN 'Rondônia'
    WHEN UF = 12 THEN 'Acre'
    WHEN UF = 13 THEN 'Amazonas'
    WHEN UF = 14 THEN 'Roraima'
    WHEN UF = 15 THEN 'Pará'
    WHEN UF = 16 THEN 'Amapá'
    WHEN UF = 17 THEN 'Tocantins'
    WHEN UF = 21 THEN 'Maranhão'
    WHEN UF = 22 THEN 'Piauí'
    WHEN UF = 23 THEN 'Ceará'
    WHEN UF = 24 THEN 'Rio Grande do Norte'
    WHEN UF = 25 THEN 'Paraíba'
    WHEN UF = 26 THEN 'Pernambuco'
    WHEN UF = 27 THEN 'Alagoas'
    WHEN UF = 28 THEN 'Sergipe'
    WHEN UF = 29 THEN 'Bahia'
    WHEN UF = 31 THEN 'Minas Gerais'
    WHEN UF = 32 THEN 'Espírito Santo'
    WHEN UF = 33 THEN 'Rio de Janeiro'
    WHEN UF = 35 THEN 'São Paulo'
    WHEN UF = 41 THEN 'Paraná'
    WHEN UF = 42 THEN 'Santa Catarina'
    WHEN UF = 43 THEN 'Rio Grande do Sul'
    WHEN UF = 50 THEN 'Mato Grosso do Sul'
    WHEN UF = 51 THEN 'Mato Grosso'
    WHEN UF = 52 THEN 'Goiás'
    WHEN UF = 53 THEN 'Distrito Federal'
    ELSE NULL
END AS uf_descricao,

CASE
    WHEN UF = 11 THEN 'Rondonia'
    WHEN UF = 12 THEN 'Acre'
    WHEN UF = 13 THEN 'Amazonas'
    WHEN UF = 14 THEN 'Roraima'
    WHEN UF = 15 THEN 'Para'
    WHEN UF = 16 THEN 'Amapa'
    WHEN UF = 17 THEN 'Tocantins'
    WHEN UF = 21 THEN 'Maranhao'
    WHEN UF = 22 THEN 'Piaui'
    WHEN UF = 23 THEN 'Ceara'
    WHEN UF = 24 THEN 'Rio Grande do Norte'
    WHEN UF = 25 THEN 'Paraiba'
    WHEN UF = 26 THEN 'Pernambuco'
    WHEN UF = 27 THEN 'Alagoas'
    WHEN UF = 28 THEN 'Sergipe'
    WHEN UF = 29 THEN 'Bahia'
    WHEN UF = 31 THEN 'Minas Gerais'
    WHEN UF = 32 THEN 'Espirito Santo'
    WHEN UF = 33 THEN 'Rio de Janeiro'
    WHEN UF = 35 THEN 'Sao Paulo'
    WHEN UF = 41 THEN 'Parana'
    WHEN UF = 42 THEN 'Santa Catarina'
    WHEN UF = 43 THEN 'Rio Grande do Sul'
    WHEN UF = 50 THEN 'Mato Grosso do Sul'
    WHEN UF = 51 THEN 'Mato Grosso'
    WHEN UF = 52 THEN 'Goias'
    WHEN UF = 53 THEN 'Distrito Federal'
    ELSE NULL
END AS uf_descricao_mapa,

CASE
    WHEN V1022 = 1 AND V1023 IN (1,2,3) THEN 'Urbana Não Metropolitana'
    WHEN V1022 = 1 AND V1023 = 4 THEN 'Urbana Metropolitana'
    WHEN V1022 = 2 THEN 'Rural'
END AS rural_urbana,

/* DEFINIR VARIAVEIS DE PESSOAS */
/* RACA COR, SEXO, FAIXAS ETARIAS */

CASE
    WHEN V2010 = 1 THEN 'Branca'
    WHEN V2010 = 2 THEN 'Preta'
    WHEN V2010 = 4 THEN 'Parda'
    WHEN V2010 IN (3,5,9) THEN 'Outros'
    ELSE NULL
END AS raca_cor,

CASE
    WHEN V2007 = 1 THEN 'Homem'
    WHEN V2007 = 2 THEN 'Mulher'
    ELSE NULL
END AS sexo,

CASE
    WHEN (V2009 BETWEEN 0 AND 5) THEN '00 a 05 anos'
    WHEN (V2009 BETWEEN 6 AND 9) THEN '06 a 09 anos'
    WHEN (V2009 BETWEEN 10 AND 14) THEN '10 a 14 anos'
    WHEN (V2009 BETWEEN 15 AND 17) THEN '15 a 17 anos'
    WHEN V2009 >= 18 THEN '18 ou mais'
    ELSE NULL
END AS faixa_etaria1,

CASE
    WHEN (V2009 BETWEEN 0 AND 5) THEN '00 a 05 anos'
    WHEN (V2009 BETWEEN 6 AND 9) THEN '06 a 09 anos'
    WHEN (V2009 BETWEEN 10 AND 14) THEN '10 a 14 anos'
    WHEN (V2009 BETWEEN 15 AND 17) THEN '15 a 17 anos'
    WHEN (V2009 BETWEEN 18 AND 29) THEN '18 a 29 anos'
    WHEN (V2009 BETWEEN 30 AND 39) THEN '30 a 39 anos'
    WHEN (V2009 BETWEEN 40 AND 64) THEN '40 a 64 anos'
    WHEN V2009 >= 65 THEN '65+ anos'
    ELSE NULL
END AS faixa_etaria2,

CASE
    WHEN (V2009 BETWEEN 0 AND 5) THEN '00 a 05 anos'
    WHEN (V2009 BETWEEN 6 AND 9) THEN '06 a 09 anos'
    WHEN (V2009 BETWEEN 10 AND 14) THEN '10 a 14 anos'
    WHEN (V2009 BETWEEN 15 AND 17) THEN '15 a 17 anos'
    WHEN (V2009 BETWEEN 18 AND 29) THEN '18 a 29 anos'
    WHEN (V2009 BETWEEN 30 AND 64) THEN '30 a 64 anos'
    WHEN V2009 >= 65 THEN '65+ anos'
    ELSE NULL
END AS faixa_etaria3,

CASE
    WHEN (V2009 BETWEEN 0 AND 9) THEN '00 a 09 anos'
    WHEN (V2009 BETWEEN 10 AND 17) THEN '15 a 17 anos'
    WHEN V2009 >= 18 THEN '18 ou mais'
    ELSE NULL
END AS faixa_etaria4,

CASE
    WHEN (V2009 BETWEEN 0 AND 9) THEN '00 a 09 anos'
    WHEN (V2009 BETWEEN 10 AND 17) THEN '10 a 17 anos'
    WHEN (V2009 BETWEEN 18 AND 29) THEN '18 a 29 anos'
    WHEN (V2009 BETWEEN 30 AND 64) THEN '30 a 64 anos'
    WHEN V2009 >= 65 THEN '65+ anos'
    ELSE NULL
END AS faixa_etaria5

FROM "Imds Projetos"."pobreza criancas adolescentes onda 1 magnitude"."- PNADC Anual Visita 1"."1 limpa".tabela
