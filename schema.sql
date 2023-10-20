CREATE DATABASE ruby_database;
CREATE TABLE labels (
    id  INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(100),
    color VARCHAR(100),
    PRIMARY KEY(id)
);
CREATE TABLE genres (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR (100),
  PRIMARY KEY (id)
);
CREATE TABLE author (
  id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
);
CREATE TABLE game (
  id INT GENERATED ALWAYS AS IDENTITY,
  author_id INT,
  multiplayer BOOLEAN,
  last_played_at BOOLEAN,
  publish_date DATE,
  archived BOOLEAN,
  PRIMARY KEY (id),
  CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES author(id)
);
CREATE TABLE books (
  id  INT,
  title VARCHAR(100),
  publisher VARCHAR(100),
  cover_state VARCHAR(100),
  FOREIGN KEY(id) REFERENCES labels(id)
);
CREATE TABLE music_albums (
  id INT GENERATED ALWAYS AS IDENTITY,
  genre_id INT,
  on_spotify BOOLEAN,
  publish_date DATE,
  archived BOOLEAN,
  PRIMARY KEY (id),
  CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genres(id)
);
CREATE TABLE item (
  id INT GENERATED ALWAYS AS IDENTITY,
  genre_id INT REFERENCES genres(id),
  label INT REFERENCES labels(id),
  author INT REFERENCES author(id),
  publish_date DATE,
  archived BOOLEAN,
  PRIMARY KEY (id)
);