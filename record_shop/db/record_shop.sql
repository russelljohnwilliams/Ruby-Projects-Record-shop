DROP TABLE stock;
DROP TABLE albums;
DROP TABLE artists;

CREATE TABLE artists(
  id serial4 PRIMARY KEY,
  name VARCHAR(255),
  genre VARCHAR(255)
);

CREATE TABLE albums(
  id serial4 PRIMARY KEY,
  title VARCHAR(255),
  address VARCHAR(255),
  format VARCHAR(255),
  cat_number VARCHAR(255),
  distributor VARCHAR(255),
  artist_id INT4 REFERENCES artists(id)
);

CREATE TABLE stock(
  id serial4 PRIMARY KEY,
  artist_id INT4 REFERENCES artists(id),
  album_id INT4 REFERENCES albums(id),
  quantity INT4,
  cost_price INT4,
  sale_price INT4,
  model_stock INT4
);