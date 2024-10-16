CREATE TABLE quote
(
    id SERIAL PRIMARY KEY,
    author_id INTEGER,
    source_id INTEGER,
    content_id INTEGER NOT NULL,
    UNIQUE ("author_id", "source_id", "content_id")
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

INSERT INTO language (iso_639_1_language_code, name) VALUES
('aa', 'Afar'),
('ab', 'Abkhazian'),
('ae', 'Avestan'),
('af', 'Afrikaans'),
('ak', 'Akan'),
('am', 'Amharic'),
('an', 'Aragonese'),
('ar', 'Arabic'),
('as', 'Assamese'),
('av', 'Avaric'),
('ay', 'Aymara'),
('az', 'Azerbaijani'),
('ba', 'Bashkir'),
('be', 'Belarusian'),
('bg', 'Bulgarian'),
('bh', 'Bihari languages'),
('bi', 'Bislama'),
('bm', 'Bambara'),
('bn', 'Bengali'),
('bo', 'Tibetan'),
('br', 'Breton'),
('bs', 'Bosnian'),
('ca', 'Catalan; Valencian'),
('ce', 'Chechen'),
('ch', 'Chamorro'),
('co', 'Corsican'),
('cr', 'Cree'),
('cs', 'Czech'),
('cu', 'Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic'),
('cv', 'Chuvash'),
('cy', 'Welsh'),
('da', 'Danish'),
('de', 'German'),
('dv', 'Divehi; Dhivehi; Maldivian'),
('dz', 'Dzongkha'),
('ee', 'Ewe'),
('el', 'Greek, Modern (1453-)'),
('en', 'English'),
('eo', 'Esperanto'),
('es', 'Spanish; Castilian'),
('et', 'Estonian'),
('eu', 'Basque'),
('fa', 'Persian'),
('ff', 'Fulah'),
('fi', 'Finnish'),
('fj', 'Fijian'),
('fo', 'Faroese'),
('fr', 'French'),
('fy', 'Western Frisian'),
('ga', 'Irish'),
('gd', 'Gaelic; Scottish Gaelic'),
('gl', 'Galician'),
('gn', 'Guarani'),
('gu', 'Gujarati'),
('gv', 'Manx'),
('ha', 'Hausa'),
('he', 'Hebrew'),
('hi', 'Hindi'),
('ho', 'Hiri Motu'),
('hr', 'Croatian'),
('ht', 'Haitian; Haitian Creole'),
('hu', 'Hungarian'),
('hy', 'Armenian'),
('hz', 'Herero'),
('ia', 'Interlingua (International Auxiliary Language Association)'),
('id', 'Indonesian'),
('ie', 'Interlingue; Occidental'),
('ig', 'Igbo'),
('ii', 'Sichuan Yi; Nuosu'),
('ik', 'Inupiaq'),
('io', 'Ido'),
('is', 'Icelandic'),
('it', 'Italian'),
('iu', 'Inuktitut'),
('ja', 'Japanese'),
('jv', 'Javanese'),
('ka', 'Georgian'),
('kg', 'Kongo'),
('ki', 'Kikuyu; Gikuyu'),
('kj', 'Kuanyama; Kwanyama'),
('kk', 'Kazakh'),
('kl', 'Kalaallisut; Greenlandic'),
('km', 'Central Khmer'),
('kn', 'Kannada'),
('ko', 'Korean'),
('kr', 'Kanuri'),
('ks', 'Kashmiri'),
('ku', 'Kurdish'),
('kv', 'Komi'),
('kw', 'Cornish'),
('ky', 'Kirghiz; Kyrgyz'),
('la', 'Latin'),
('lb', 'Luxembourgish; Letzeburgesch'),
('lg', 'Ganda'),
('li', 'Limburgan; Limburger; Limburgish'),
('ln', 'Lingala'),
('lo', 'Lao'),
('lt', 'Lithuanian'),
('lu', 'Luba-Katanga'),
('lv', 'Latvian'),
('mg', 'Malagasy'),
('mh', 'Marshallese'),
('mi', 'Maori'),
('mk', 'Macedonian'),
('ml', 'Malayalam'),
('mn', 'Mongolian'),
('mr', 'Marathi'),
('ms', 'Malay'),
('mt', 'Maltese'),
('my', 'Burmese'),
('na', 'Nauru'),
('nb', 'Bokmål, Norwegian; Norwegian Bokmål'),
('nd', 'Ndebele, North; North Ndebele'),
('ne', 'Nepali'),
('ng', 'Ndonga'),
('nl', 'Dutch; Flemish'),
('nn', 'Norwegian Nynorsk; Nynorsk, Norwegian'),
('no', 'Norwegian'),
('nr', 'Ndebele, South; South Ndebele'),
('nv', 'Navajo; Navaho'),
('ny', 'Chichewa; Chewa; Nyanja'),
('oc', 'Occitan (post 1500)'),
('oj', 'Ojibwa'),
('om', 'Oromo'),
('or', 'Oriya'),
('os', 'Ossetian; Ossetic'),
('pa', 'Panjabi; Punjabi'),
('pi', 'Pali'),
('pl', 'Polish'),
('ps', 'Pushto; Pashto'),
('pt', 'Portuguese'),
('qu', 'Quechua'),
('rm', 'Romansh'),
('rn', 'Rundi'),
('ro', 'Romanian; Moldavian; Moldovan'),
('ru', 'Russian'),
('rw', 'Kinyarwanda'),
('sa', 'Sanskrit'),
('sc', 'Sardinian'),
('sd', 'Sindhi'),
('se', 'Northern Sami'),
('sg', 'Sango'),
('si', 'Sinhala; Sinhalese'),
('sk', 'Slovak'),
('sl', 'Slovenian'),
('sm', 'Samoan'),
('sn', 'Shona'),
('so', 'Somali'),
('sq', 'Albanian'),
('sr', 'Serbian'),
('ss', 'Swati'),
('st', 'Sotho, Southern'),
('su', 'Sundanese'),
('sv', 'Swedish'),
('sw', 'Swahili'),
('ta', 'Tamil'),
('te', 'Telugu'),
('tg', 'Tajik'),
('th', 'Thai'),
('ti', 'Tigrinya'),
('tk', 'Turkmen'),
('tl', 'Tagalog'),
('tn', 'Tswana'),
('to', 'Tonga (Tonga Islands)'),
('tr', 'Turkish'),
('ts', 'Tsonga'),
('tt', 'Tatar'),
('ug', 'Uighur; Uyghur'),
('uk', 'Ukrainian'),
('ur', 'Urdu'),
('uz', 'Uzbek'),
('ve', 'Venda'),
('vi', 'Vietnamese'),
('vo', 'Volapük'),
('wa', 'Walloon'),
('wo', 'Wolof'),
('xh', 'Xhosa'),
('yi', 'Yiddish'),
('yo', 'Yoruba'),
('za', 'Zhuang; Chuang'),
('zh', 'Chinese'),
('zu', 'Zulu');

INSERT INTO author (penname)
VALUES
    ('F. Scott Fitzgerald'),
    ('Gabriel García Márquez'),
    ('J.D. Salinger'),
    ('Harper Lee'),
    ('George Orwell'),
    ('Jane Austen'),
    ('J.R.R. Tolkien'),
    ('Aldous Huxley'),
    ('Anne Frank'),
    ('Antoine de Saint-Exupéry'),
    ('Miguel de Cervantes'),
    ('Herman Melville'),
    ('Leo Tolstoy'),
    ('William Shakespeare'),
    ('Homer'),
    ('Gustave Flaubert'),
    ('Dante Alighieri'),
    ('Vladimir Nabokov'),
    ('Fyodor Dostoevsky'),
    ('Emily Brontë'),
    ('Albert Camus'),
    ('Franz Kafka'),
    ('James Joyce'),
    ('John Steinbeck'),
    ('Joseph Conrad'),
    ('Ernest Hemingway'),
    ('Alexandre Dumas'),
    ('Oscar Wilde'),
    ('Charlotte Brontë'),
    ('Victor Hugo'),
    ('Mary Shelley'),
    ('Paulo Coelho'),
    ('Ken Kesey'),
    ('Charles Dickens'),
    ('Mikhail Bulgakov'),
    ('Douglas Adams'),
    ('Ray Bradbury'),
    ('Hans Christian Andersen'),
    ('Lewis Carroll'),
    ('Umberto Eco'),
    ('Haruki Murakami'),
    ('Milan Kundera'),
    ('Murasaki Shikibu'),
    ('Margaret Atwood');

INSERT INTO source (title, description, original_language_id, original_publication_date)
VALUES
    ('The Great Gatsby', 'A novel by F. Scott Fitzgerald', (SELECT id FROM language WHERE name = 'English'), '1925-04-10'),
    ('One Hundred Years of Solitude', 'A landmark novel by Gabriel García Márquez', (SELECT id FROM language WHERE name = 'Spanish; Castilian'), '1967-05-30'),
    ('The Catcher in the Rye', 'A coming-of-age novel by J.D. Salinger', (SELECT id FROM language WHERE name = 'English'), '1951-07-16'),
    ('To Kill a Mockingbird', 'Harper Lee''s Pulitzer Prize-winning novel', (SELECT id FROM language WHERE name = 'English'), '1960-07-11'),
    ('1984', 'George Orwell''s dystopian social science fiction novel', (SELECT id FROM language WHERE name = 'English'), '1949-06-08'),
    ('Pride and Prejudice', 'Jane Austen''s romantic novel', (SELECT id FROM language WHERE name = 'English'), '1813-01-28'),
    ('The Hobbit', 'J.R.R. Tolkien''s fantasy novel', (SELECT id FROM language WHERE name = 'English'), '1937-09-21'),
    ('Brave New World', 'Aldous Huxley''s dystopian novel', (SELECT id FROM language WHERE name = 'English'), '1932-01-01'),
    ('The Diary of a Young Girl', 'Anne Frank''s wartime diary', (SELECT id FROM language WHERE name = 'Dutch; Flemish'), '1947-06-25'),
    ('The Little Prince', 'Antoine de Saint-Exupéry''s novella', (SELECT id FROM language WHERE name = 'French'), '1943-04-06'),
    ('Don Quixote', 'Miguel de Cervantes'' satirical novel', (SELECT id FROM language WHERE name = 'Spanish; Castilian'), '1605-01-16'),
    ('Moby-Dick', 'Herman Melville''s novel about whaling', (SELECT id FROM language WHERE name = 'English'), '1851-10-18'),
    ('War and Peace', 'Leo Tolstoy''s historical novel', (SELECT id FROM language WHERE name = 'Russian'), '1869-01-01'),
    ('Hamlet', 'William Shakespeare''s tragedy', (SELECT id FROM language WHERE name = 'English'), '1603-01-01'),
    ('The Odyssey', 'Homer''s ancient Greek epic poem', (SELECT id FROM language WHERE name = 'Greek, Modern (1453-)'), '0800-01-01 BC'),
    ('Madame Bovary', 'Gustave Flaubert''s debut novel', (SELECT id FROM language WHERE name = 'French'), '1856-10-01'),
    ('The Divine Comedy', 'Dante Alighieri''s long narrative poem', (SELECT id FROM language WHERE name = 'Italian'), '1320-01-01'),
    ('Lolita', 'Vladimir Nabokov''s controversial novel', (SELECT id FROM language WHERE name = 'English'), '1955-09-15'),
    ('Crime and Punishment', 'Fyodor Dostoevsky''s psychological novel', (SELECT id FROM language WHERE name = 'Russian'), '1866-01-01'),
    ('The Brothers Karamazov', 'Fyodor Dostoevsky''s final novel', (SELECT id FROM language WHERE name = 'Russian'), '1880-11-01'),
    ('Wuthering Heights', 'Emily Brontë''s only novel', (SELECT id FROM language WHERE name = 'English'), '1847-12-01'),
    ('The Stranger', 'Albert Camus'' philosophical novel', (SELECT id FROM language WHERE name = 'French'), '1942-01-01'),
    ('The Metamorphosis', 'Franz Kafka''s novella', (SELECT id FROM language WHERE name = 'German'), '1915-01-01'),
    ('Ulysses', 'James Joyce''s modernist novel', (SELECT id FROM language WHERE name = 'English'), '1922-02-02'),
    ('The Trial', 'Franz Kafka''s philosophical novel', (SELECT id FROM language WHERE name = 'German'), '1925-01-01'),
    ('The Grapes of Wrath', 'John Steinbeck''s Pulitzer Prize-winning novel', (SELECT id FROM language WHERE name = 'English'), '1939-04-14'),
    ('Anna Karenina', 'Leo Tolstoy''s realist novel', (SELECT id FROM language WHERE name = 'Russian'), '1877-01-01'),
    ('Heart of Darkness', 'Joseph Conrad''s novella', (SELECT id FROM language WHERE name = 'English'), '1899-02-01'),
    ('The Old Man and the Sea', 'Ernest Hemingway''s novella', (SELECT id FROM language WHERE name = 'English'), '1952-09-01'),
    ('The Count of Monte Cristo', 'Alexandre Dumas'' adventure novel', (SELECT id FROM language WHERE name = 'French'), '1844-08-28'),
    ('The Picture of Dorian Gray', 'Oscar Wilde''s philosophical novel', (SELECT id FROM language WHERE name = 'English'), '1890-07-01'),
    ('Jane Eyre', 'Charlotte Brontë''s novel', (SELECT id FROM language WHERE name = 'English'), '1847-10-16'),
    ('The Iliad', 'Homer''s ancient Greek epic poem', (SELECT id FROM language WHERE name = 'Greek, Modern (1453-)'), '0762-01-01 BC'),
    ('Les Misérables', 'Victor Hugo''s historical novel', (SELECT id FROM language WHERE name = 'French'), '1862-01-01'),
    ('Frankenstein', 'Mary Shelley''s Gothic novel', (SELECT id FROM language WHERE name = 'English'), '1818-01-01'),
    ('The Alchemist', 'Paulo Coelho''s novel', (SELECT id FROM language WHERE name = 'Portuguese'), '1988-01-01'),
    ('One Flew Over the Cuckoo''s Nest', 'Ken Kesey''s novel', (SELECT id FROM language WHERE name = 'English'), '1962-02-01'),
    ('A Tale of Two Cities', 'Charles Dickens'' historical novel', (SELECT id FROM language WHERE name = 'English'), '1859-04-30'),
    ('The Master and Margarita', 'Mikhail Bulgakov''s novel', (SELECT id FROM language WHERE name = 'Russian'), '1967-01-01'),
    ('The Hitchhiker''s Guide to the Galaxy', 'Douglas Adams'' comedy science fiction series', (SELECT id FROM language WHERE name = 'English'), '1979-10-12'),
    ('The Lord of the Rings', 'J.R.R. Tolkien''s high fantasy novel', (SELECT id FROM language WHERE name = 'English'), '1954-07-29'),
    ('Fahrenheit 451', 'Ray Bradbury''s dystopian novel', (SELECT id FROM language WHERE name = 'English'), '1953-10-19'),
    ('The Little Mermaid', 'Hans Christian Andersen''s fairy tale', (SELECT id FROM language WHERE name = 'Danish'), '1837-04-07'),
    ('Alice''s Adventures in Wonderland', 'Lewis Carroll''s novel', (SELECT id FROM language WHERE name = 'English'), '1865-11-26'),
    ('The Name of the Rose', 'Umberto Eco''s historical murder mystery novel', (SELECT id FROM language WHERE name = 'Italian'), '1980-01-01'),
    ('The Wind-Up Bird Chronicle', 'Haruki Murakami''s novel', (SELECT id FROM language WHERE name = 'Japanese'), '1994-04-12'),
    ('The Unbearable Lightness of Being', 'Milan Kundera''s philosophical novel', (SELECT id FROM language WHERE name = 'Czech'), '1984-01-01'),
    ('The Tale of Genji', 'Murasaki Shikibu''s classic work of Japanese literature', (SELECT id FROM language WHERE name = 'Japanese'), '1008-01-01'),
    ('The Handmaid''s Tale', 'Margaret Atwood''s dystopian novel', (SELECT id FROM language WHERE name = 'English'), '1985-01-01');

INSERT INTO source_author (source_id, author_id)
VALUES
    ((SELECT id FROM source WHERE title = 'The Great Gatsby'), (SELECT id FROM author WHERE penname = 'F. Scott Fitzgerald')),
    ((SELECT id FROM source WHERE title = 'One Hundred Years of Solitude'), (SELECT id FROM author WHERE penname = 'Gabriel García Márquez')),
    ((SELECT id FROM source WHERE title = 'The Catcher in the Rye'), (SELECT id FROM author WHERE penname = 'J.D. Salinger')),
    ((SELECT id FROM source WHERE title = 'To Kill a Mockingbird'), (SELECT id FROM author WHERE penname = 'Harper Lee')),
    ((SELECT id FROM source WHERE title = '1984'), (SELECT id FROM author WHERE penname = 'George Orwell')),
    ((SELECT id FROM source WHERE title = 'Pride and Prejudice'), (SELECT id FROM author WHERE penname = 'Jane Austen')),
    ((SELECT id FROM source WHERE title = 'The Hobbit'), (SELECT id FROM author WHERE penname = 'J.R.R. Tolkien')),
    ((SELECT id FROM source WHERE title = 'Brave New World'), (SELECT id FROM author WHERE penname = 'Aldous Huxley')),
    ((SELECT id FROM source WHERE title = 'The Diary of a Young Girl'), (SELECT id FROM author WHERE penname = 'Anne Frank')),
    ((SELECT id FROM source WHERE title = 'The Little Prince'), (SELECT id FROM author WHERE penname = 'Antoine de Saint-Exupéry')),
    ((SELECT id FROM source WHERE title = 'Don Quixote'), (SELECT id FROM author WHERE penname = 'Miguel de Cervantes')),
    ((SELECT id FROM source WHERE title = 'Moby-Dick'), (SELECT id FROM author WHERE penname = 'Herman Melville')),
    ((SELECT id FROM source WHERE title = 'War and Peace'), (SELECT id FROM author WHERE penname = 'Leo Tolstoy')),
    ((SELECT id FROM source WHERE title = 'Hamlet'), (SELECT id FROM author WHERE penname = 'William Shakespeare')),
    ((SELECT id FROM source WHERE title = 'The Odyssey'), (SELECT id FROM author WHERE penname = 'Homer')),
    ((SELECT id FROM source WHERE title = 'Madame Bovary'), (SELECT id FROM author WHERE penname = 'Gustave Flaubert')),
    ((SELECT id FROM source WHERE title = 'The Divine Comedy'), (SELECT id FROM author WHERE penname = 'Dante Alighieri')),
    ((SELECT id FROM source WHERE title = 'Lolita'), (SELECT id FROM author WHERE penname = 'Vladimir Nabokov')),
    ((SELECT id FROM source WHERE title = 'Crime and Punishment'), (SELECT id FROM author WHERE penname = 'Fyodor Dostoevsky')),
    ((SELECT id FROM source WHERE title = 'The Brothers Karamazov'), (SELECT id FROM author WHERE penname = 'Fyodor Dostoevsky')),
    ((SELECT id FROM source WHERE title = 'Wuthering Heights'), (SELECT id FROM author WHERE penname = 'Emily Brontë')),
    ((SELECT id FROM source WHERE title = 'The Stranger'), (SELECT id FROM author WHERE penname = 'Albert Camus')),
    ((SELECT id FROM source WHERE title = 'The Metamorphosis'), (SELECT id FROM author WHERE penname = 'Franz Kafka')),
    ((SELECT id FROM source WHERE title = 'Ulysses'), (SELECT id FROM author WHERE penname = 'James Joyce')),
    ((SELECT id FROM source WHERE title = 'The Trial'), (SELECT id FROM author WHERE penname = 'Franz Kafka')),
    ((SELECT id FROM source WHERE title = 'The Grapes of Wrath'), (SELECT id FROM author WHERE penname = 'John Steinbeck')),
    ((SELECT id FROM source WHERE title = 'Anna Karenina'), (SELECT id FROM author WHERE penname = 'Leo Tolstoy')),
    ((SELECT id FROM source WHERE title = 'Heart of Darkness'), (SELECT id FROM author WHERE penname = 'Joseph Conrad')),
    ((SELECT id FROM source WHERE title = 'The Old Man and the Sea'), (SELECT id FROM author WHERE penname = 'Ernest Hemingway')),
    ((SELECT id FROM source WHERE title = 'The Count of Monte Cristo'), (SELECT id FROM author WHERE penname = 'Alexandre Dumas')),
    ((SELECT id FROM source WHERE title = 'The Picture of Dorian Gray'), (SELECT id FROM author WHERE penname = 'Oscar Wilde')),
    ((SELECT id FROM source WHERE title = 'Jane Eyre'), (SELECT id FROM author WHERE penname = 'Charlotte Brontë')),
    ((SELECT id FROM source WHERE title = 'The Iliad'), (SELECT id FROM author WHERE penname = 'Homer')),
    ((SELECT id FROM source WHERE title = 'Les Misérables'), (SELECT id FROM author WHERE penname = 'Victor Hugo')),
    ((SELECT id FROM source WHERE title = 'Frankenstein'), (SELECT id FROM author WHERE penname = 'Mary Shelley')),
    ((SELECT id FROM source WHERE title = 'The Alchemist'), (SELECT id FROM author WHERE penname = 'Paulo Coelho')),
    ((SELECT id FROM source WHERE title = 'One Flew Over the Cuckoo''s Nest'), (SELECT id FROM author WHERE penname = 'Ken Kesey')),
    ((SELECT id FROM source WHERE title = 'A Tale of Two Cities'), (SELECT id FROM author WHERE penname = 'Charles Dickens')),
    ((SELECT id FROM source WHERE title = 'The Master and Margarita'), (SELECT id FROM author WHERE penname = 'Mikhail Bulgakov')),
    ((SELECT id FROM source WHERE title = 'The Hitchhiker''s Guide to the Galaxy'), (SELECT id FROM author WHERE penname = 'Douglas Adams')),
    ((SELECT id FROM source WHERE title = 'The Lord of the Rings'), (SELECT id FROM author WHERE penname = 'J.R.R. Tolkien')),
    ((SELECT id FROM source WHERE title = 'Fahrenheit 451'), (SELECT id FROM author WHERE penname = 'Ray Bradbury')),
    ((SELECT id FROM source WHERE title = 'The Little Mermaid'), (SELECT id FROM author WHERE penname = 'Hans Christian Andersen')),
    ((SELECT id FROM source WHERE title = 'Alice''s Adventures in Wonderland'), (SELECT id FROM author WHERE penname = 'Lewis Carroll')),
    ((SELECT id FROM source WHERE title = 'The Name of the Rose'), (SELECT id FROM author WHERE penname = 'Umberto Eco')),
    ((SELECT id FROM source WHERE title = 'The Wind-Up Bird Chronicle'), (SELECT id FROM author WHERE penname = 'Haruki Murakami')),
    ((SELECT id FROM source WHERE title = 'The Unbearable Lightness of Being'), (SELECT id FROM author WHERE penname = 'Milan Kundera')),
    ((SELECT id FROM source WHERE title = 'The Tale of Genji'), (SELECT id FROM author WHERE penname = 'Murasaki Shikibu')),
    ((SELECT id FROM source WHERE title = 'The Handmaid''s Tale'), (SELECT id FROM author WHERE penname = 'Margaret Atwood'));

INSERT INTO content (content)
VALUES
    ('So we beat on, boats against the current, borne back ceaselessly into the past.'),
    ('Many years later, as he faced the firing squad, Colonel Aureliano Buendía was to remember that distant afternoon when his father took him to discover ice.'),
    ('Don''t ever tell anybody anything. If you do, you start missing everybody.'),
    ('You never really understand a person until you consider things from his point of view... Until you climb inside of his skin and walk around in it.'),
    ('Big Brother is watching you.'),
    ('It is a truth universally acknowledged, that a single man in possession of a good fortune, must be in want of a wife.'),
    ('In a hole in the ground there lived a hobbit.'),
    ('Words can be like X-rays if you use them properly -- they''ll go through anything. You read and you''re pierced.'),
    ('I keep my ideals, because in spite of everything I still believe that people are really good at heart.'),
    ('All grown-ups were once children... but only few of them remember it.'),
    ('Somewhere, something incredible is waiting to be known.'),
    ('Call me Ishmael.'),
    ('All happy families are alike; each unhappy family is unhappy in its own way.'),
    ('To be, or not to be, that is the question.'),
    ('Sing, O muse, of the rage of Achilles, son of Peleus, that brought countless ills upon the Achaeans.'),
    ('Madame Bovary, c''est moi.'),
    ('In the middle of the journey of our life I found myself within a dark woods where the straight way was lost.'),
    ('Lolita, light of my life, fire of my loins. My sin, my soul.'),
    ('Pain and suffering are always inevitable for a large intelligence and a deep heart.'),
    ('Above all, don''t lie to yourself. The man who lies to himself and listens to his own lie comes to a point that he cannot distinguish the truth within him, or around him, and so loses all respect for himself and for others.'),
    ('Whatever our souls are made of, his and mine are the same.'),
    ('Mother died today. Or maybe yesterday; I can''t be sure.'),
    ('As Gregor Samsa awoke one morning from uneasy dreams he found himself transformed in his bed into a gigantic insect.'),
    ('Stately, plump Buck Mulligan came from the stairhead, bearing a bowl of lather on which a mirror and a razor lay crossed.'),
    ('Someone must have slandered Josef K., for one morning, without having done anything truly wrong, he was arrested.'),
    ('To the red country and part of the gray country of Oklahoma, the last rains came gently, and they did not cut the scarred earth.'),
    ('All we can know is that we know nothing. And that''s the height of human wisdom.'),
    ('The horror! The horror!'),
    ('But man is not made for defeat. A man can be destroyed but not defeated.'),
    ('All human wisdom is contained in these two words - Wait and Hope.'),
    ('The only way to get rid of temptation is to yield to it.'),
    ('I would always rather be happy than dignified.'),
    ('Rage - Goddess, sing the rage of Peleus'' son Achilles.'),
    ('It was the best of times, it was the worst of times, it was the age of wisdom, it was the age of foolishness...'),
    ('To live is the rarest thing in the world. Most people exist, that is all.'),
    ('The Alchemist picked up a book that someone in the caravan had brought. Leafing through the pages, he found a story about Narcissus.'),
    ('They''re out there. Black boys in white suits up before me to commit sex acts in the hall and get it mopped up before I can catch them.'),
    ('It was a bright cold day in April, and the clocks were striking thirteen.'),
    ('Manuscripts don''t burn.'),
    ('The Answer to the Great Question... Of Life, the Universe and Everything... Is... Forty-two,'' said Deep Thought, with infinite majesty and calm.'),
    ('Three Rings for the Elven-kings under the sky, Seven for the Dwarf-lords in their halls of stone...'),
    ('It was a pleasure to burn.'),
    ('The real lover is the man who can thrill you by kissing your forehead or smiling into your eyes or just staring into space.'),
    ('If you want to know what a man''s like, take a good look at how he treats his inferiors, not his equals.'),
    ('In the name of the Father, the Son, and the Holy Ghost.'),
    ('The moment one learns English, complications set in.'),
    ('The heaviest of burdens is therefore simultaneously an image of life''s most intense fulfillment.'),
    ('Real love isn''t the kind that endures through long years of absence, but the kind that endures through long years of nearness.'),
    ('Nolite te bastardes carborundorum.');

INSERT INTO quote (author_id, source_id, content_id)
SELECT
    sa.author_id,
    sa.source_id,
    c.id AS content_id
FROM
    source_author sa
INNER JOIN
    source s ON sa.source_id = s.id
INNER JOIN
    content c ON c.id = (
        CASE s.title
            WHEN 'The Great Gatsby' THEN 1
            WHEN 'One Hundred Years of Solitude' THEN 2
            WHEN 'The Catcher in the Rye' THEN 3
            WHEN 'To Kill a Mockingbird' THEN 4
            WHEN '1984' THEN 5
            WHEN 'Pride and Prejudice' THEN 6
            WHEN 'The Hobbit' THEN 7
            WHEN 'Brave New World' THEN 8
            WHEN 'The Diary of a Young Girl' THEN 9
            WHEN 'The Little Prince' THEN 10
            WHEN 'Don Quixote' THEN 11
            WHEN 'Moby-Dick' THEN 12
            WHEN 'War and Peace' THEN 27
            WHEN 'Hamlet' THEN 14
            WHEN 'The Odyssey' THEN 15
            WHEN 'Madame Bovary' THEN 16
            WHEN 'The Divine Comedy' THEN 17
            WHEN 'Lolita' THEN 18
            WHEN 'Crime and Punishment' THEN 19
            WHEN 'The Brothers Karamazov' THEN 20
            WHEN 'Wuthering Heights' THEN 21
            WHEN 'The Stranger' THEN 22
            WHEN 'The Metamorphosis' THEN 23
            WHEN 'Ulysses' THEN 24
            WHEN 'The Trial' THEN 25
            WHEN 'The Grapes of Wrath' THEN 26
            WHEN 'Anna Karenina' THEN 13
            WHEN 'Heart of Darkness' THEN 28
            WHEN 'The Old Man and the Sea' THEN 29
            WHEN 'The Count of Monte Cristo' THEN 30
            WHEN 'The Picture of Dorian Gray' THEN 31
            WHEN 'Jane Eyre' THEN 32
            WHEN 'The Iliad' THEN 33
            WHEN 'Les Misérables' THEN 34
            WHEN 'Frankenstein' THEN 35
            WHEN 'The Alchemist' THEN 36
            WHEN 'One Flew Over the Cuckoo''s Nest' THEN 37
            WHEN 'A Tale of Two Cities' THEN 38
            WHEN 'The Master and Margarita' THEN 39
            WHEN 'The Hitchhiker''s Guide to the Galaxy' THEN 40
            WHEN 'The Lord of the Rings' THEN 41
            WHEN 'Fahrenheit 451' THEN 42
            WHEN 'The Little Mermaid' THEN 43
            WHEN 'Alice''s Adventures in Wonderland' THEN 44
            WHEN 'The Name of the Rose' THEN 45
            WHEN 'The Wind-Up Bird Chronicle' THEN 46
            WHEN 'The Unbearable Lightness of Being' THEN 47
            WHEN 'The Tale of Genji' THEN 48
            WHEN 'The Handmaid''s Tale' THEN 49
        END
    )
ORDER BY sa.author_id, sa.source_id;

SELECT DISTINCT
    q.id as id,
    a.penname as author_penname,
    s.title as source_title,
    c.content as content
FROM
    quote as q
INNER JOIN content as c on q.content_id = c.id
INNER JOIN author as a ON q.author_id = a.id
INNER JOIN source as s ON q.source_id = s.id
ORDER BY author_penname, source_title;

SELECT
    q.id AS quote_id,
    a.penname AS author_name,
    s.title AS source_title,
    c.content AS quote_content
FROM
    quote q
JOIN
    content c ON q.content_id = c.id
LEFT JOIN
    author a ON q.author_id = a.id
LEFT JOIN
    source s ON q.source_id = s.id
LEFT JOIN
    source_author sa ON s.id = sa.source_id AND (q.author_id = sa.author_id OR q.author_id IS NULL)
ORDER BY
    author_name, source_title;

INSERT INTO language (iso_639_1_language_code, name) VALUES
('en', 'English');

INSERT INTO author (penname) VALUES
('Neil Gaiman'),
('Terry Pratchett'),
('Douglas Preston'),
('Lincoln Child'),
('Stephen King'),
('Peter Straub');

INSERT INTO source (title, original_language_id, original_publication_date) VALUES
('Good Omens', (SELECT id FROM language WHERE iso_639_1_language_code = 'en'), '1990-05-01'),
('The Talisman', (SELECT id FROM language WHERE iso_639_1_language_code = 'en'), '1984-11-08'),
('The Relic', (SELECT id FROM language WHERE iso_639_1_language_code = 'en'), '1995-01-15');

INSERT INTO source_author (source_id, author_id) VALUES
((SELECT id FROM source WHERE title = 'Good Omens'), (SELECT id FROM author WHERE penname = 'Neil Gaiman')),
((SELECT id FROM source WHERE title = 'Good Omens'), (SELECT id FROM author WHERE penname = 'Terry Pratchett')),
((SELECT id FROM source WHERE title = 'The Talisman'), (SELECT id FROM author WHERE penname = 'Stephen King')),
((SELECT id FROM source WHERE title = 'The Talisman'), (SELECT id FROM author WHERE penname = 'Peter Straub')),
((SELECT id FROM source WHERE title = 'The Relic'), (SELECT id FROM author WHERE penname = 'Douglas Preston')),
((SELECT id FROM source WHERE title = 'The Relic'), (SELECT id FROM author WHERE penname = 'Lincoln Child'));

INSERT INTO content (content) VALUES
('It may help to understand human affairs to be clear that most of the great triumphs and tragedies of history are caused, not by people being fundamentally good or fundamentally bad, but by people being fundamentally people.'),
('Sunlight is a way of life in the Southwest. A casual visitor might easily conclude that it was for sale in the local supermarkets.'),
('Territories, as every male animal knows, are secured by shitting on them. Thats the way it worked in the Oligocene, and thats the way it works in the condominium association.');

INSERT INTO quote (author_id, source_id, content_id) VALUES
((SELECT id FROM author WHERE penname = 'Neil Gaiman'),
 (SELECT id FROM source WHERE title = 'Good Omens'),
 (SELECT id FROM content WHERE content LIKE 'It may help to understand%')),
((SELECT id FROM author WHERE penname = 'Douglas Preston'),
 (SELECT id FROM source WHERE title = 'The Relic'),
 (SELECT id FROM content WHERE content LIKE 'Sunlight is a way of life%')),
((SELECT id FROM author WHERE penname = 'Stephen King'),
 (SELECT id FROM source WHERE title = 'The Talisman'),
 (SELECT id FROM content WHERE content LIKE 'Territories, as every male animal%'));