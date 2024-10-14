CREATE TABLE quote
(
    id SERIAL PRIMARY KEY,
    author_id INTEGER,
    source_id INTEGER,
    content_id INTEGER NOT NULL
);
-- NULL author_id means the author of the quote is unknown
-- NULL source_id means there's no particular source of the quote
-- content_id must not be NULL - at least content must exist

-- source has author too
-- but there could be many authors of single source
-- and the quote can have only one

-- if the source has many authors
-- and the author of the particular quote is unknown
-- the quote source is NOT NULL but the quote author is NULL

CREATE TABLE author
(
    id SERIAL PRIMARY KEY,
    penname VARCHAR(255) NOT NULL UNIQUE
);

-- penname is the name used on publications
-- at this moment we assume the author is identified by the penname
-- that means one author can has many pennames therefore many related author records

CREATE TABLE source
(
    id SERIAL PRIMARY KEY,
    title VARCHAR(1023),
    original_language_id INTEGER NOT NULL,
    original_publication_date DATE
);

CREATE TABLE content
(
    id SERIAL PRIMARY KEY,
    content TEXT NOT NULL
);

CREATE TABLE language
(
    id SERIAL PRIMARY KEY,
    iso_639-1_language_code CHAR(2)
);
