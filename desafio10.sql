SELECT 
	song.song_name AS nome,
	COUNT(hist.song_id) AS reproducoes
FROM SpotifyClone.song AS song
INNER JOIN SpotifyClone.song_history AS hist
	ON hist.song_id = song.song_id
INNER JOIN SpotifyClone.user AS users
	ON users.user_id = hist.user_id
WHERE users.account_id IN(1,4)
GROUP BY nome
ORDER BY nome;