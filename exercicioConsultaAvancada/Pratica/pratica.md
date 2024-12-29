Segunda Parte:

1.
SELECT s.title AS Series_Title, g.name AS Genre_Name
FROM series s
JOIN genres g ON s.genre_id = g.id;

2.
SELECT e.title AS Episode_Title, 
       a.first_name AS Actor_Name, 
       a.last_name AS Actor_Last_Name
FROM episodes e
JOIN actor_episode ae ON e.id = ae.episode_id
JOIN actors a ON ae.actor_id = a.id;

3.
SELECT s.title AS Series_Title, COUNT(se.id) AS Total_Seasons
FROM series s
LEFT JOIN seasons se ON s.id = se.serie_id  -- Usando a coluna correta
GROUP BY s.id;

4.
SELECT g.name AS Genre_Name, COUNT(m.id) AS Total_Movies
FROM genres g
LEFT JOIN movies m ON g.id = m.genre_id
GROUP BY g.id
HAVING COUNT(m.id) >= 3;

5.
SELECT DISTINCT a.first_name AS Actor_Name, a.last_name AS Actor_Last_Name
FROM actors a
JOIN actor_movie am ON a.id = am.actor_id
JOIN movies m ON am.movie_id = m.id
WHERE m.title LIKE 'La Guerra de las galaxias: Episodio%'  -- Títulos atualizados corretamente
GROUP BY a.id
HAVING COUNT(DISTINCT m.id) = (SELECT COUNT(*) FROM movies WHERE title LIKE 'La Guerra de las galaxias: Episodio%');