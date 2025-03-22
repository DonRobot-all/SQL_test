-- Получить всех игроков
SELECT player_id, username, email, registration_date
FROM Players;

-- Получить все игры жанра 'RPG'
SELECT game_id, title, genre, release_year
FROM Games
WHERE genre = 'RPG';

-- Получить все сессии, длительность которых больше 60 минут
SELECT p.username, g.title, s.start_time, s.end_time, s.duration_minutes
FROM Sessions s
JOIN Players p ON s.player_id = p.player_id
JOIN Games g ON s.game_id = g.game_id
WHERE s.duration_minutes > 60;


-- Получить время, проведенное каждым игроком в каждой игре
SELECT p.username, g.title AS game_title, s.start_time, s.end_time, s.duration_minutes
FROM Sessions s
JOIN Players p ON s.player_id = p.player_id
JOIN Games g ON s.game_id = g.game_id
ORDER BY s.start_time DESC;


-- Получить список игроков и игр, в которых они играли
SELECT p.username, g.title AS game_title
FROM Sessions s
JOIN Players p ON s.player_id = p.player_id
JOIN Games g ON s.game_id = g.game_id
ORDER BY p.username;


-- Получить количество сессий для каждого игрока
SELECT p.username, COUNT(s.session_id) AS session_count
FROM Players p
LEFT JOIN Sessions s ON p.player_id = s.player_id
GROUP BY p.username
ORDER BY session_count DESC;
