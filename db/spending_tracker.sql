DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;
DROP TABLE users;

CREATE TABLE merchants
(
  id SERIAL PRIMARY KEY,
  name VARCHAR
);

CREATE TABLE tags
(
  id SERIAL PRIMARY KEY,
  type VARCHAR
);

CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  budget DECIMAL
);

CREATE TABLE transactions
(
  id SERIAL PRIMARY KEY,
  amount DECIMAL(9,2),
  merchant_id INT REFERENCES merchants(id),
  tag_id INT REFERENCES tags(id),
  user_id INT REFERENCES users(id),
  timestamp VARCHAR
);
