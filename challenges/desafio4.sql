SELECT 
  pu.nome AS pessoa_usuaria, 
  CASE WHEN MAX(YEAR(hr.reproducao)) >= 2021 THEN 'Ativa' ELSE 'Inativa' END AS status_pessoa_usuaria
FROM pessoa_usuaria AS pu
INNER JOIN historico_reproducao AS hr
ON pu.id = hr.usuario_id
GROUP BY pu.nome
ORDER BY pu.nome;