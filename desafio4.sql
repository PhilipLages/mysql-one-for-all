SELECT user_name AS usuario,
(
	SELECT IF(YEAR(playback_date) >= 2021, "Usuário ativo", "Usuário inativo")
    FROM SpotifyClone.song_history AS hist
    WHERE hist.user_id = users.user_id
    ORDER BY playback_date DESC
    LIMIT 1
) AS status_usuario
FROM SpotifyClone.user AS users
ORDER BY usuario ASC;