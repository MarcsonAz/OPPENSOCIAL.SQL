/*
percentual_pessoas_sem_maquina_de_lavar_roupas    ok
percentual_64_anos_ou_menos_moram_com_65_anos_ou_mais  calcular no nivel do dom
percentual_pessoas_moram_com_responsavel_homem_sem_conjuge   definir tipo de resp    e conjuge
percentual_pessoas_moram_em_domicilio_com_conjuge   
razao_entre_idade_media_responsavel_conjuge_e_filhos_0_17_anos  idade media pais e idade media filhos
percentual_da_renda_domiciliar_gasta_com_aluguel_ou_prestacao   valor do aluguel - onde esta essa variavel
percentual_pessoas_gastam_30_por_cento_ou_mais_renda_domiciliar_com_aluguel depende da acima
percentual_pessoas_moram_com_adensamento_maior_3  - calcular # de pessoas no domicilio e # dormitorios
anos_estudo_pessoas_25_anos_ou_mais_no_domicilio 
anos_estudo_responsavel_conjuge  - IDENTIFICAR RESP OU CONJUGE
um_ou_mais_anos_defasagem_idade_serie_maximo_21_anos - DEFASAGEM ATE 21 ANOS
percentual_25_anos_ou_mais_analfabetos_no_domicilio
percentual_25_anos_ou_mais_nao_completaram_ensino_fundamental_no_domicilio
percentual_responsavel_conjuge_nao_completaram_ensino_superior
distorcao_idade_serie
qtd_celular_por_morador_acima_10_anos_no_domicilio


*/

SELECT *,

CASE
    WHEN S0104 == 2 AND V2009 BETWEEN 0 AND 17 THEN 1
    ELSE NULL
END AS sem_maquina_lavar_0_17,

CASE
    WHEN V2009 >= 25 THEN VD3005
    ELSE NULL
END AS anos_estudo_pessoas_25_anos_ou_mais_no_domicilio

CASE
    WHEN 
END AS um_ou_mais_anos_defasagem_idade_serie_maximo_21_anos







FROM tabela


























