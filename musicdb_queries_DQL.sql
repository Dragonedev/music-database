-- EXIBIR USUÁRIOS E SEUS CONTATOS
SELECT
	u.username AS username,
	u.email AS email,
	c.celular AS contact
	FROM users u
	JOIN contact c ON u.id = c.users_id;

-- EXIBIR MÚSICAS E SEUS ARTISTAS NAS PLAYLIST
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

-- EXIBIR AS MÚSICAS COM MAIS STREAMS
SELECT 
	m.title AS music,
	COUNT(sl.id) AS total_streams
	FROM music m
	JOIN stream_log sl ON m.id = sl.music_id
	GROUP BY m.title
	ORDER BY total_streams DESC;

-- EXIBIR A MÚSICA QUE CADA USUÁRIO OUVIU
SELECT 
	u.username AS usuario,
	m.title AS musica
	FROM stream_log sl
	JOIN users u ON sl.users_id =u.id
	JOIN music m ON sl.music_id = m.id
	ORDER BY u.username;

-- EXIBIR USUÁRIOS COM A MAIOR QUANTIDADE DE STREAMS
SELECT 
	u.username AS users,
	COUNT (sl.id) AS total_streams
	FROM stream_log sl
	JOIN users u ON sl.users_id = u.id
	GROUP BY u.username
	ORDER BY total_streams DESC;

-- EXIBIR GENERO MAIS PRESENTE EM PLAYLIST POR USUÁRIO
SELECT
	u.username AS nome,
	g.genre AS genero,
	COUNT(g.id) AS total_genre
	FROM music_playlist mp
	JOIN music m ON mp.music_id = m.id
	JOIN playlist p ON mp.playlist_id = p.id
	JOIN users u ON p.users_id = u.id
	JOIN music_genre mg ON mg.music_id = m.id
	JOIN genre g ON mg.genre_id = g.id
	GROUP BY u.username, g.genre
	ORDER BY total_genre DESC;

-- EXIBIR MÚSICAS QUE NUNCA FORAM REPRODUZIDAS
SELECT
	m.title AS musica
	FROM music m
	LEFT JOIN stream_log sl ON m.id = sl.music_id
	GROUP BY m.title
	HAVING COUNT(sl.id) = 0;

-- EXIBIR PLAYLISTS COM A QUANTIDADE TOTAL DE MÚSICAS CADASTRADAS

SELECT
	p.playlist_name AS titulo,
	COUNT(mp.music_id) AS quantidade_musicas
	FROM music_playlist mp
	JOIN playlist p ON mp.playlist_id = p.id
	GROUP BY p.playlist_name
	ORDER BY quantidade_musicas DESC;
		



	