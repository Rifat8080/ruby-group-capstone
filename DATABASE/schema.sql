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