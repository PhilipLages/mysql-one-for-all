SELECT user_name AS usuario,
(
	SELECT COUNT(*) FROM SpotifyClone.song_history AS hist
    WHERE hist.user_id = users.user_id
) AS qt_de_musicas_ouvidas,
(
	SELECT ROUND(SUM(duration / 60), 2) FROM SpotifyClone.song AS song
    INNER JOIN SpotifyClone.song_history AS hist
    ON song.song_id = hist.song_id
    WHERE hist.user_id = users.user_id
) AS total_minutos
FROM SpotifyClone.user AS users ORDER BY usuario;