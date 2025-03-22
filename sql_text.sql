CREATE TABLE Players (
    player_id INTEGER PRIMARY KEY AUTOINCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Games (
    game_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    release_year INTEGER
);

CREATE TABLE Sessions (
    session_id INTEGER PRIMARY KEY AUTOINCREMENT,
    player_id INTEGER,
    game_id INTEGER,
    duration_minutes INTEGER,
    FOREIGN KEY (player_id) REFERENCES Players(player_id) ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES Games(game_id) ON DELETE CASCADE
);

--ON DELETE CASCADE — это опция в SQL, которая автоматически удаляет строки из дочерней таблицы при удалении 
--соответствующей строки в родительской таблице. 


--CURRENT_TIMESTAMP в SQLite — это функция, которая возвращает текущую дату и время при вставке или обновлении 
--записи в таблице. 