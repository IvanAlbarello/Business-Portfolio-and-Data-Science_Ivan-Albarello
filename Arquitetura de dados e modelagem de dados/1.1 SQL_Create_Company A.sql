-- SQL: GABARITO COM CRIAÇÃO DE BANCO DE DADOS Hypera.db by Ivan Raphael Albarello 28 de Maio de 2024


-- A. Quais os 3 produtos com maior faturamento no ano de 2024:

-- query
SELECT CODIGO_PRODUTO, SUM(VALOR_R$) AS FATURAMENTO_TOTAL
FROM FATO
WHERE PERIODO BETWEEN 202401 AND 202412
GROUP BY CODIGO_PRODUTO
ORDER BY FATURAMENTO_TOTAL DESC
LIMIT 3;

-- RESULTADO

   CODIGO_PRODUTO  FATURAMENTO_TOTAL
             10              2750
             9               2500
             8               2250


--- B. Quais as quantidades de Clientes ativos em "SP" na tabela loja:

-- query
SELECT COUNT(*) AS clientes_ativos
FROM LOJA
WHERE UF = 'SP' AND ATIVO_S_N = 'S';

-- RESULTADO
  clientes_ativos
0                1

-- C. Quais as quantidades/Volume de produto promovidos *(s) com vendas no último mês 03 de 2024:

-- query
SELECT PRODUTO.DESCRICAO, PRODUTO.PROMOVIDO_S_N, FATO.PERIODO, FATO.VOLUME
FROM PRODUTO INNER JOIN FATO ON PRODUTO.CODIGO = FATO.CODIGO_PRODUTO
WHERE (((PRODUTO.PROMOVIDO_S_N) In ("S")) AND ((FATO.PERIODO) In ("202403")));

-- RESULTADO

   CODIGO   DESCRICAO  TOTAL_VOLUME
1       6  Loratadina           350

-- D. Quais são as 10 lojas com maior faturamento no ano de 2024:

-- query
SELECT 
    CNPJ_LOJA, 
    FATO.VOLUME*FATO.[VALOR_R$] AS TOTAL_FATURAMENTO,
FROM 
    FATO
WHERE 
    PERIODO >= 202401 AND PERIODO <= 202412
GROUP BY 
    CNPJ_LOJA
ORDER BY 
    TOTAL_FATURAMENTO DESC
LIMIT 10

-- RESULTADO * TEMOS 5 REGISTROS NO PERIODO DE 2024

        CNPJ_LOJA  TOTAL_FATURAMENTO
0  12345678000101             662500
1  12345678000105             450000
2  12345678000104             312500
3  12345678000103             200000
4  12345678000102             112500

-- E. Qual o total de vendas mensais por categoria:


SELECT PRODUTO.CATEGORIA, FATO.PERIODO, Sum(FATO.VOLUME) AS TOTAL_VOLUME
FROM FATO INNER JOIN PRODUTO ON FATO.CODIGO_PRODUTO = PRODUTO.CODIGO
GROUP BY PRODUTO.CATEGORIA, FATO.PERIODO
ORDER BY TOTAL_VOLUME DESC;


-- RESULTADO 

CATEGORIA	PERIODO	TOTAL_VOLUME
Antiemético	202305	        550
Antiácido	202305	        500
Anti-inflamatório	202304	450
Antialérgico	202304	    400
Antialérgico	202403	    350
Antiflatulento	202403	    300
Antiácido	202402	        250
Analgésico	202401	        250
Anti-inflamatório 202402	200

