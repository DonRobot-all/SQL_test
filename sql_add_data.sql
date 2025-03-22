-- Добавляем 100 игроков
INSERT INTO Players (username, email) 
SELECT 
    CONCAT('Player', id), 
    CONCAT('player', id, '@example.com') 
FROM (SELECT @id := @id + 1 AS id FROM (SELECT @id := 0) AS init, 
      information_schema.tables LIMIT 100) AS t;

-- Добавляем 50 игр
INSERT INTO Games (title, genre, release_year) 
SELECT 
    CONCAT('Game', id), 
    ELT(1 + (id % 5), 'RPG', 'Shooter', 'Adventure', 'Strategy', 'Sports'),
    2000 + (id % 25)
FROM (SELECT @id := @id + 1 AS id FROM (SELECT @id := 0) AS init, 
      information_schema.tables LIMIT 50) AS t;

-- Добавляем 500 игровых сессий случайным образом
INSERT INTO Sessions (player_id, game_id, start_time, end_time)
SELECT 
    FLOOR(1 + RAND() * 100),  -- случайный игрок
    FLOOR(1 + RAND() * 50),   -- случайная игра
    NOW() - INTERVAL FLOOR(RAND() * 365) DAY - INTERVAL FLOOR(RAND() * 24) HOUR,  -- случайная дата за последний год
    NOW() - INTERVAL FLOOR(RAND() * 365) DAY - INTERVAL FLOOR(RAND() * 24) HOUR + INTERVAL FLOOR(30 + RAND() * 120) MINUTE  -- случайная продолжительность от 30 до 150 минут
FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) AS t1,
     (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) AS t2;
