SELECT song_name AS cancao,
(
	SELECT COUNT(*) FROM SpotifyClone.song_history AS hist
    WHERE hist.song_id = song.song_id
) AS reproducoes
FROM SpotifyClone.song AS song
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;