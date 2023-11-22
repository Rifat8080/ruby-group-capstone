-- Create Database
DROP DATABASE IF EXISTS Ruby_Catalog_Group_Capstone_Project;
CREATE DATABASE Ruby_Catalog_Group_Capstone_Project;

-- Use Database
USE Ruby_Catalog_Group_Capstone_Project;

-- Table: Item
CREATE TABLE Item (
  id INT PRIMARY KEY,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  publish_date DATE,
  archived BOOLEAN,
  FOREIGN KEY (genre_id) REFERENCES Genre(id),
  FOREIGN KEY (author_id) REFERENCES Author(id),
  FOREIGN KEY (source_id) REFERENCES Source(id),
  FOREIGN KEY (label_id) REFERENCES Label(id)
);

-- Table: Book
CREATE TABLE Book (
  item_id INT PRIMARY KEY,
  publisher VARCHAR(255),
  cover_state VARCHAR(255),
  FOREIGN KEY (item_id) REFERENCES Item(id)
);

-- Table: Label
CREATE TABLE Label (
  id INT PRIMARY KEY,
  title VARCHAR(255),
  color VARCHAR(255)
);

-- Create the genres table
CREATE TABLE IF NOT EXIST genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create the music_albums table
CREATE TABLE IF NOT EXIST music_albums (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    artist VARCHAR(255) NOT NULL,
    release_year INT NOT NULL,
    on_spotify BOOLEAN NOT NULL,
    genre_id INT,
    FOREIGN KEY (genre_id) REFERENCES genres(id),
    published_date DATE NOT NULL,
    archived BOOLEAN NOT NULL
);