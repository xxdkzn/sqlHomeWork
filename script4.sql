-- Создание таблицы "genres"
CREATE TABLE genres (
    id VARCHAR PRIMARY KEY,
    name VARCHAR
);

-- Создание таблицы "performers"
CREATE TABLE performers (
    id VARCHAR PRIMARY KEY,
    pseudonym VARCHAR
);

-- Создание таблицы "performers_albums"
CREATE TABLE performers_albums (
    performer_id VARCHAR,
    album_id VARCHAR,
    FOREIGN KEY (performer_id) REFERENCES performers(id),
    FOREIGN KEY (album_id) REFERENCES albums(id),
    PRIMARY KEY (performer_id, album_id)
);

-- Создание таблицы "albums"
CREATE TABLE albums (
    id VARCHAR PRIMARY KEY,
    title VARCHAR,
    release_year INTEGER CHECK (release_year >= 1900)
);

-- Создание таблицы "tracks"
CREATE TABLE tracks (
    id VARCHAR PRIMARY KEY,
    name VARCHAR,
    duration INTEGER CHECK (duration > 0),
    album_id VARCHAR,
    FOREIGN KEY (album_id) REFERENCES albums(id)
);

-- Создание таблицы "performers_genres"
CREATE TABLE performers_genres (
    performer_id VARCHAR,
    genre_id VARCHAR,
    FOREIGN KEY (performer_id) REFERENCES performers(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id),
    PRIMARY KEY (performer_id, genre_id)
);

-- Создание таблицы "compilations"
CREATE TABLE compilations (
    id VARCHAR PRIMARY KEY,
    title VARCHAR,
    release_year INTEGER CHECK (release_year >= 1900)
);

-- Создание таблицы "compilations_tracks"
CREATE TABLE compilations_tracks (
    compilation_id VARCHAR,
    track_id VARCHAR,
    FOREIGN KEY (compilation_id) REFERENCES compilations(id),
    FOREIGN KEY (track_id) REFERENCES tracks(id),
    PRIMARY KEY (compilation_id, track_id)
);