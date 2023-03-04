SELECT 
  COUNT(usuario_id) AS musicas_no_historico
FROM historico_reproducao
WHERE usuario_id = 1;