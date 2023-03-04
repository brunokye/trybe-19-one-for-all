SELECT 
  pa.nome AS artista,
  a.nome AS album,
  COUNT(`as`.artista_id) AS pessoas_seguidoras
FROM pessoa_artista AS pa
INNER JOIN album AS a
ON pa.id = a.artista_id
INNER JOIN artista_seguido AS `as`
ON pa.id = `as`.artista_id
GROUP BY pa.nome, a.nome
ORDER BY pessoas_seguidoras DESC, pa.nome, a.nome;