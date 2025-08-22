---- Esta consulta acessa os dados do INFORMATION_SCHEMA para obter o que precisamos
SELECT DISTINCT
  column_name as nome_coluna,
  STRING_AGG(table_name, ', ' ORDER BY column_name) AS lista_tabelas, -- Retorna todas as colunas de uma tabela X declarada abaixo
  COUNT(table_name) AS numero_tabelas -- Conta em quantas tabelas a coluna X está presente
FROM `bigquery-public-data`.ebi_chembl.INFORMATION_SCHEMA.COLUMN_FIELD_PATHS
GROUP BY 1 
