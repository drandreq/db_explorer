SELECT -- Parte 3: Elenca todas as tabela e suas respectivas colunas e com quais outras tabelas - usando aquela coluna - você poderia relacionar.
  tabelas.tabela,
  tabelas.coluna,
  colunas.lista_tabelas,
  colunas.numero_tabelas

FROM ( -- Parte 1: Elenca todas as colunas de todas as tabelas.
  SELECT DISTINCT
    table_name AS tabela,
    column_name AS coluna, -- Retorna todas as colunas de uma tabela X declarada abaixo
  FROM `bigquery-public-data`.ebi_chembl.INFORMATION_SCHEMA.COLUMN_FIELD_PATHS
  ) AS tabelas  

LEFT JOIN (-- Parte 2: Lista todas as tabelas que podem se relacionar através de uma dada coluna.
  SELECT DISTINCT
    column_name as coluna,
    STRING_AGG(table_name, ', ' ORDER BY column_name) AS lista_tabelas, -- Retorna todas as colunas de uma tabela X declarada abaixo
    COUNT(table_name) AS numero_tabelas -- Conta em quantas tabelas a coluna X está presente
  FROM `bigquery-public-data`.ebi_chembl.INFORMATION_SCHEMA.COLUMN_FIELD_PATHS
  GROUP BY 1 
  ) AS colunas ON (
    tabelas.coluna = colunas.coluna
  ) 

WHERE 
  tabelas.coluna NOT LIKE 'dt_%' -- Colunas de data se repetem na maioria das tabelas e não servem para relações entre tabelas
  AND tabelas.coluna NOT LIKE 'hr_%' -- Colunas de hora se repetem na maioria das tabelas e não servem para relações entre tabelas
  -- AND REGEXP_CONTAINS(tabelas.coluna, r"cd_usuario") -- Utilizado para encontrar tabelas que contém essa coluna e facilitar saber como você pode relacionar ela.
  -- AND colunas.numero_tabelas > 1 -- Mostrará apenas colunas presentes em mais de uma tabela
ORDER BY numero_tabelas DESC