SELECT Count(*) AS cancoes,
(
	SELECT Count(*) FROM SpotifyClone.artist
) AS artistas,
(
	SELECT Count(*) FROM SpotifyClone.album
) AS albuns
FROM SpotifyClone.song;