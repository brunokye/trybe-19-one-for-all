SELECT 
  ROUND(MIN(valor), 2) AS faturamento_minimo,
  ROUND(MAX(valor), 2) AS faturamento_maximo,
  ROUND(AVG(valor), 2) AS faturamento_medio,
  ROUND(SUM(valor), 2) AS faturamento_total
FROM plano AS p
INNER JOIN pessoa_usuaria AS pu
ON p.id = pu.plano_id;