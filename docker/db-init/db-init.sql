ALTER USER admin PASSWORD 'admin';

CREATE SCHEMA IF NOT EXISTS web_store AUTHORIZATION admin;
GRANT ALL ON SCHEMA web_store TO admin;

ALTER ROLE admin SET search_path = web_store;

SET SCHEMA 'web_store';

CREATE TABLE order_items
(
    id              SERIAL          ,
    order_id        INTEGER         NOT NULL,
    product_id      INTEGER         NOT NULL,
    quantity        INTEGER         NOT NULL    
);

CREATE TABLE orders
(
    id              SERIAL          ,
    user_id         INTEGER         NOT NULL,
    status          TEXT            COLLATE pg_catalog."default" NOT NULL,
    created_at      TIMESTAMP       WITHOUT TIME ZONE NOT NULL
);

CREATE TABLE password_reset_tokens
(
    id              SERIAL          ,
    user_id         INTEGER         NOT NULL,
    token           TEXT            COLLATE pg_catalog."default" NOT NULL,
    created_at      TIMESTAMP       DEFAULT now(),
    expires_at      TIMESTAMP       NOT NULL
);

CREATE TABLE products
(
    id              SERIAL      ,
    name            TEXT        NOT NULL,
    description     TEXT        NOT NULL,
    price           NUMERIC     NOT NULL,
    image_path      TEXT        DEFAULT NULL
 
);

CREATE TABLE users
(
    id              SERIAL      ,
    name            TEXT        NOT NULL,
    email           TEXT        NOT NULL,
    password        TEXT        NOT NULL

);

CREATE TABLE cart_items
(
    id              SERIAL      ,
    user_id         INTEGER     NOT NULL,
    product_id      INTEGER     NOT NULL,
    quantity        INTEGER     NOT NULL


);

CREATE TABLE customers (
    id              SERIAL      ,
    name            TEXT        NOT NULL,
    email           TEXT        NOT NULL UNIQUE,
    address         TEXT,
    phone           TEXT
);

