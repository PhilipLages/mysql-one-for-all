SELECT 
	singer.artist_name AS artista,
	album.album_name AS album
FROM SpotifyClone.artist AS singer
INNER JOIN SpotifyClone.album AS album
	ON singer.artist_id = album.artist_id
WHERE artist_name = "Elis Regina";