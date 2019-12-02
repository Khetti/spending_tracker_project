DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE tags;

CREATE TABLE merchants
(
  id SERIAL PRIMARY KEY,
  name VARCHAR not null
);

CREATE TABLE tags
(
  id SERIAL PRIMARY KEY,
  type VARCHAR not null
);

CREATE TABLE transactions
(
  id SERIAL PRIMARY KEY,
  amount DECIMAL(4,2) not null,
  merchant_id INT REFERENCES merchants(id),
  tag_id INT REFERENCES tag(id)
);
