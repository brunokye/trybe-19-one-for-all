SELECT 
  c.nome AS cancao, 
  COUNT(hr.cancao_id) AS reproducoes
FROM cancao AS c
INNER JOIN historico_reproducao AS hr
ON c.id = hr.cancao_id
GROUP BY c.nome
ORDER BY reproducoes DESC, c.nome
LIMIT 2;