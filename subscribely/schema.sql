DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
  user_id INT PRIMARY KEY,
  email TEXT,
  password TEXT
);
DROP TABLE IF EXISTS user_modo;
CREATE TABLE IF NOT EXISTS user_modo (
  user_id INT PRIMARY KEY REFERENCES users(user_id),
  modo_account_id TEXT,
  modo_vault_id TEXT,
  last_four_credit_card TEXT
);
DROP TABLE IF EXISTS services;
CREATE TABLE IF NOT EXISTS services (
  service_id INT PRIMARY KEY,
  name TEXT
);
DROP TABLE IF EXISTS user_subscriptions;
CREATE TABLE IF NOT EXISTS user_subscriptions (
  subscription_id INT PRIMARY KEY,
  user_id INT REFERENCES users(user_id),
  service_id INT REFERENCES services(service_id),
  username TEXT,
  password TEXT,
  is_active BOOLEAN,
  activity_ts TIMESTAMP,
  next_charge_dt DATE,
  next_charge_amt DOUBLE PRECISION
);
DROP TABLE IF EXISTS transaction_history;
CREATE TABLE IF NOT EXISTS transaction_history (
  transaction_id INT PRIMARY KEY,
  user_id INT REFERENCES users(user_id),
  service_id INT REFERENCES services(service_id),
  transaction_ts TIMESTAMP,
  transaction_amt DOUBLE PRECISION
);

INSERT INTO users VALUES (1, 'kperry@yomail.com', 'tswifty');
INSERT INTO services VALUES (1, 'Spotify');
INSERT INTO user_modo VALUES (1, '71033440-6aa3-46f3-accb-30a6387bdd67', '176a2c58-ee13-4d97-b3cf-45b6d3bf1a76', '5432');
INSERT INTO user_subscriptions VALUES (1, 1, 1, 'ktperryfan007', 'tswifty', 1, '2016-10-22', '2016-11-01', 9.99);
