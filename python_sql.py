import sqlite3

# Подключаемся к базе данных (или создаём её, если она не существует)
conn = sqlite3.connect('test_db.db')
cursor = conn.cursor()

# Создаем таблицы
cursor.execute('''
CREATE TABLE IF NOT EXISTS Players (
    player_id INTEGER PRIMARY KEY AUTOINCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
)
''')

cursor.execute('''
CREATE TABLE IF NOT EXISTS Games (
    game_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    release_year INTEGER
)
''')

cursor.execute('''
CREATE TABLE IF NOT EXISTS Sessions (
    session_id INTEGER PRIMARY KEY AUTOINCREMENT,
    player_id INTEGER,
    game_id INTEGER,
    duration_minutes INTEGER,
    FOREIGN KEY (player_id) REFERENCES Players(player_id) ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES Games(game_id) ON DELETE CASCADE
)
''')

# Вставка данных в таблицу Players
cursor.executemany('''
INSERT OR IGNORE INTO Players (username, email)
VALUES (?, ?)
''', [
    ('player1', 'player1@example.com'),
    ('player2', 'player2@example.com'),
    ('player3', 'player3@example.com')
])

# Вставка данных в таблицу Games
cursor.executemany('''
INSERT OR IGNORE INTO Games (title, genre, release_year)
VALUES (?, ?, ?)
''', [
    ('Game 1', 'Adventure', 2022),
    ('Game 2', 'Action', 2021),
    ('Game 3', 'RPG', 2020)
])

# Вставка данных в таблицу Sessions
cursor.executemany('''
INSERT OR IGNORE INTO Sessions (player_id, game_id, duration_minutes)
VALUES (?, ?, ?)
''', [
    (1, 1, 120),  # Player 1 играет в Game 1, 120 минут
    (1, 2, 45),   # Player 1 играет в Game 2, 45 минут
    (2, 3, 90),   # Player 2 играет в Game 3, 90 минут
    (3, 1, 60)    # Player 3 играет в Game 1, 60 минут
])

# Сохраняем изменения
conn.commit()

# Закрываем соединение
conn.close()

print("Таблицы и данные успешно добавлены!")
