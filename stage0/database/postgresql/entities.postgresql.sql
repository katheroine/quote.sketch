CREATE TABLE quote
(
    id SERIAL PRIMARY KEY,
    source_id INTEGER,
    content_id INTEGER NOT NULL,
    UNIQUE ("source_id", "content_id")
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

-- Quote may (but doesn't have to) come from the source.
-- Both quote and source can have authors.
-- Both quote and source can have none, one or more authors.
-- There is a reason why quote has its separated association table for the authors.
-- Sometimes the source, e.g. book, has many authors, but particular chapters are written
-- by particular author, what is mentioned in the source.
-- In such case, the particular part of the source, the quote comes from, has the particular author
-- and this single author can be assigned to the quote,
-- during the source has to heve all its authors associated with.
-- When it's impossible to point out the exact author of the particular source part,
-- all the source authors have to be assinged to the quote.

CREATE TABLE quote_author
(
    quote_id INTEGER NOT NULL,
    author_id INTEGER NOT NULL,
    UNIQUE ("quote_id", "author_id")
)

CREATE TABLE source
(
    id SERIAL PRIMARY KEY,
    title VARCHAR(1023),
    description VARCHAR(1023), -- This field is especially important for sources without title
    original_language_id INTEGER NOT NULL,
    original_publication_date DATE,
    CHECK (title IS NOT NULL OR description IS NOT NULL)
);
COMMENT ON COLUMN source.description IS 'This field is especially important for sources without title';

CREATE TABLE source_author
(
    source_id INTEGER NOT NULL,
    author_id INTEGER NOT NULL,
    UNIQUE ("source_id", "author_id")
);

CREATE TABLE language
(
    id SERIAL PRIMARY KEY,
    iso_639_1_language_code CHAR(2) NOT NULL,
    name VARCHAR(128) NOT NULL
);

CREATE TABLE content
(
    id SERIAL PRIMARY KEY,
    content TEXT NOT NULL
);
