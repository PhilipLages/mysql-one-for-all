SELECT 
	ar.artist_name AS artista, 
	al.album_name AS album,
    COUNT(f.artist_id) AS seguidores
FROM SpotifyClone.artist AS ar
INNER JOIN SpotifyClone.album AS al
	ON ar.artist_id = al.artist_id
INNER JOIN SpotifyClone.followed_artist AS f
	ON al.artist_id = f.artist_id
GROUP BY artist_name, album_name
ORDER BY seguidores DESC, artist_name ASC, album_name ASC;