SELECT
	u.username AS username,
	c.celular AS contact
	FROM users u
	JOIN contact c ON u.id = c.users_id;

SELECT
    p.playlist_name AS playlist,
    m.title AS music,
    a.artist_name AS artist
	FROM music_playlist mp
	JOIN playlist p ON mp.playlist_id = p.id
	JOIN music m ON mp.music_id = m.id
	JOIN artist_music am ON m.id = am.music_id
	JOIN artist a ON am.artist_id = a.id
	ORDER BY p.playlist_name;

SELECT 
	m.title AS music,
	COUNT(sl.id) AS total_streams
	FROM music m
	JOIN stream_log sl ON m.id = sl.music_id
	GROUP BY m.title
	ORDER BY total_streams DESC;



	