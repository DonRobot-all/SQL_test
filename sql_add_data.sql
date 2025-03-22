-- Вставка данных в таблицу Players
INSERT INTO Players (username, email)
VALUES
    ('player1', 'player1@example.com'),
    ('player2', 'player2@example.com'),
    ('player3', 'player3@example.com');

-- Вставка данных в таблицу Games
INSERT INTO Games (title, genre, release_year)
VALUES
    ('Game 1', 'Adventure', 2022),
    ('Game 2', 'Action', 2021),
    ('Game 3', 'RPG', 2020);

-- Вставка данных в таблицу Sessions
INSERT INTO Sessions (player_id, game_id, duration_minutes)
VALUES
    (1, 1, 120), -- Player 1 играет в Game 1, 120 минут
    (1, 2, 45),  -- Player 1 играет в Game 2, 45 минут
    (2, 3, 90),  -- Player 2 играет в Game 3, 90 минут
    (3, 1, 60);  -- Player 3 играет в Game 1, 60 минут