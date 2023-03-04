SELECT 
	COUNT(DISTINCT c.id) AS cancoes, 
    COUNT(DISTINCT pa.id) AS artistas, 
    COUNT(DISTINCT a.id) AS albuns
FROM cancao AS c
INNER JOIN pessoa_artista AS pa 
INNER JOIN album AS a;