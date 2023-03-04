SELECT 
  pa.nome AS artista,
  a.nome AS album
FROM pessoa_artista AS pa
INNER JOIN album AS a
ON pa.id = a.artista_id
WHERE pa.nome = 'Elis Regina'
ORDER BY a.nome;