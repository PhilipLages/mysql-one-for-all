SELECT COUNT(hist.song_id) AS quantidade_musicas_no_historico
FROM SpotifyClone.song_history AS hist
INNER JOIN SpotifyClone.user AS users
	ON users.user_id = hist.user_id
WHERE users.user_name = "Barbara Liskov";