SELECT 
  pu.nome AS pessoa_usuaria, 
  COUNT(hr.usuario_id) AS musicas_ouvidas, 
  SUM(c.duracao) AS total_minutos
FROM pessoa_usuaria AS pu
INNER JOIN historico_reproducao AS hr 
ON pu.id = hr.usuario_id
INNER JOIN cancao AS c
ON hr.cancao_id = c.id
GROUP BY pu.id
ORDER BY pu.nome;