--Boston Lingwall
--SQL 11
--05/02/23

--make artist table
CREATE TABLE artists
(
    artist_id NUMBER(3) PRIMARY KEY NOT NULL,
    name VARCHAR(120) NOT NULL
    

);

--make genere table
CREATE TABLE genre
(
    genre_id NUMBER(3) PRIMARY KEY NOT NULL,
    name VARCHAR(120) NOT NULL
    

);

--mkae media_types table
CREATE TABLE media_types
(
    media_type_id NUMBER(3) PRIMARY KEY NOT NULL,
    name VARCHAR(120) NOT NULL
    

);

--make albums table
CREATE TABLE albums
(
    album_id NUMBER(3) PRIMARY KEY NOT NULL,
    title VARCHAR(160) NOT NULL,
    artist_id NUMBER(3) NOT NULL,
    year DATE 
    

);

--making artist_id fk
ALTER TABLE
    albums
ADD CONSTRAINT
    fk_artist_albums
FOREIGN KEY
    (artist_id)
REFERENCES
    artists (artist_id)
ON DELETE
    CASCADE
;

--makes tracks table
CREATE TABLE tracks
(
    track_id NUMBER(5) PRIMARY KEY NOT NULL,
    name VARCHAR(200) NOT NULL,
    album_id NUMBER(3) NOT NULL,
    artist_id NUMBER(3),
    media_type_id NUMBER(3),
    genre_id NUMBER(3),
    composer VARCHAR(220),
    milliseconds NUMBER(10) NOT NULL,
    bytes NUMBER(10) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    play_count NUMBER(3) NOT NULL,
    skip_count NUMBER(4) NOT NULL,
    track_index NUMBER(3)
);

-- make artist_id, media_type_id, and genres an FK

ALTER TABLE
    tracks
ADD CONSTRAINT
    fk_artist_tracks
FOREIGN KEY
    (artist_id)
REFERENCES
    artists (artist_id)
ON DELETE
    CASCADE
;

--makes album_id fk
ALTER TABLE
    tracks
ADD CONSTRAINT
    fk_albums_tracks
FOREIGN KEY
    (album_id)
REFERENCES
    albums (album_id)
ON DELETE
    CASCADE
;

--insert data into media type
INSERT INTO
media_types
(
    media_type_id,
    name
)
WITH p AS
(
    SELECT 1 AS media_type_id, 'MPEG audi file' AS name FROM dual UNION ALL
    SELECT 2, 'internet audio stream' FROM dual UNION ALL
    SELECT 3, 'AAC audi file' FROM dual UNION ALL
    SELECT 4, 'Purchased AAC audio file' AS name FROM dual UNION ALL
    SELECT 5, 'PDF document' AS name FROM dual UNION ALL
    SELECT 6, 'Protected AAC audio file' AS name FROM dual 

)

SELECT p.media_type_id, p.name FROM p;

--insert artist_ids and names into artist
INSERT INTO
artists
(
    artist_id,
    name
)
WITH p AS
(
    SELECT 12 AS artist_id, 'Bigod' AS name FROM dual UNION ALL
    SELECT 13, 'The Cure' FROM dual UNION ALL
    SELECT 22, 'RJD2' FROM dual UNION ALL
    SELECT 28, '(+44)' FROM dual UNION ALL
    SELECT 32, 'Paramore' FROM dual UNION ALL
    SELECT 38, 'P!nk' FROM dual UNION ALL
    SELECT 46, 'Gorillaz' FROM dual UNION ALL
    SELECT 48, 'Bishopp Briggs' FROM dual UNION ALL
    SELECT 49, 'Sheryl Crow' FROM dual UNION ALL
    SELECT 55, 'Voodoo Glow Skulls' FROM dual UNION ALL
    SELECT 65, 'Jony Cash' FROM dual UNION ALL
    SELECT 95, 'Death Cab for Cutie' FROM dual UNION ALL
    SELECT 97, 'Taylor Swift' FROM dual UNION ALL
    SELECT 98, 'Erasure' FROM dual UNION ALL
    SELECT 119, 'Nero' FROM dual UNION ALL
    SELECT 120, 'Gus Gus' FROM dual UNION ALL
    SELECT 126, 'Henry Rollins' FROM dual UNION ALL
    SELECT 127, 'Elvis Costello' FROM dual UNION ALL
    SELECT 732, 'Veruca Salt' FROM dual UNION ALL
    SELECT 733, 'Horny Toad!' FROM dual UNION ALL
    SELECT 737, 'Zedd' FROM dual UNION ALL
    SELECT 752, 'The Veronicas' FROM dual  
    

)

SELECT * FROM p;
--insert 22 rows into genre_id
INSERT INTO
genre
(
    genre_id,
    name
)
WITH b AS
(
    SELECT 1 AS genre_id, 'Sound Effect' AS name FROM dual UNION ALL
    SELECT 2, 'Pop' AS name FROM dual UNION ALL
    SELECT 3, 'Rock' AS name FROM dual UNION ALL
    SELECT 4, 'Alternative' AS name FROM dual UNION ALL
    SELECT 5, 'Industrial' AS name FROM dual UNION ALL
    SELECT 6, 'Soundtrack' AS name FROM dual UNION ALL
    SELECT 7, 'Holiday' AS name FROM dual UNION ALL
    SELECT 8, 'Dance - Electronica' AS name FROM dual UNION ALL
    SELECT 9, 'Unknown Genre' AS name FROM dual UNION ALL
    SELECT 10, 'Tween' AS name FROM dual UNION ALL
    SELECT 11, 'Country' AS name FROM dual UNION ALL
    SELECT 12, 'Electronic' AS name FROM dual UNION ALL
    SELECT 13, 'Blues' AS name FROM dual UNION ALL
    SELECT 14, 'Dance' AS name FROM dual UNION ALL
    SELECT 15, 'Comendy' AS name FROM dual UNION ALL
    SELECT 16, 'Punk' AS name FROM dual UNION ALL
    SELECT 17, 'Classical' AS name FROM dual UNION ALL
    SELECT 18, 'Hard Rock' AS name FROM dual UNION ALL
    SELECT 19, 'Trance' AS name FROM dual UNION ALL
    SELECT 20, 'Hip-Hop - Rap' AS name FROM dual UNION ALL
    SELECT 21, 'Ska' AS name FROM dual UNION ALL
    SELECT 22, 'Other' AS name FROM dual 
)

SELECT b.genre_id, b.name FROM b;


--adding album_id, tilte, year, and artist_id to the album table

SELECT p.artist_id, p.name FROM p;

INSERT INTO
albums
(
    album_id,
    title, 
    year,
    artist_id
)
WITH p AS
(
    SELECT 74 AS album_id, 'The Bog / I-Q' AS title, null AS year, 12 AS artist_id FROM dual UNION ALL
    SELECT 84, 'Faith(2005 Remaster Deluxe Edition)', TO_DATE(2005, 'YYYY'), 13 FROM dual UNION ALL
    SELECT 85, 'Nightmare Reviseted', TO_DATE(2008, 'YYYY'), 22 FROM dual UNION ALL
    SELECT 89, 'When Your Heart Stops Beating(Explicit)', TO_DATE(2002, 'YYYY'), 28 FROM dual UNION ALL
    SELECT 93, 'Riot!', null, 32 FROM dual UNION ALL
    SELECT 176, 'Funhouse(Deluxe version)', TO_DATE(2008, 'YYYY'), 38 FROM dual UNION ALL
    SELECT 178, 'Ultra Dubstep', TO_DATE(2013, 'YYYY'), 119 FROM dual UNION ALL
    SELECT 179, 'Tranceport(Paul Oakenfold)', TO_DATE(1998, 'YYYY'), 120 FROM dual UNION ALL
    SELECT 185, 'no title', TO_DATE(1991, 'YYYY'), 126 FROM dual UNION ALL
    SELECT 186, 'This Years model', null, 127 FROM dual UNION ALL
    SELECT 191, 'American Thighs', TO_DATE(1994, 'YYYY'), 732 FROM dual UNION ALL
    SELECT 192, 'Thirteen', TO_DATE(2001, 'YYYY'), 733 FROM dual UNION ALL
    SELECT 198, 'Plans', null, 95 FROM dual UNION ALL
    SELECT 200, 'Stars Come Out(Dilon Francis Remix)', TO_DATE(2012, 'YYYY'), 737 FROM dual UNION ALL
    SELECT 332, 'M!SsUndaztod', TO_DATE(2001, 'YYYY'), 38 FROM dual UNION ALL
    SELECT 340, 'Feel Good Inc - sSingle', TO_DATE(2005, 'YYYY'), 46 FROM dual UNION ALL
    SELECT 342, 'Church of Stars', null, 48 FROM dual UNION ALL
    SELECT 343, 'The Very Best of Sheryl Crow', null, 49 FROM dual UNION ALL
    SELECT 348, 'Who Is, this Is?', TO_DATE(1990, 'YYYY'), 55 FROM dual UNION ALL
    SELECT 435, 'Hook Me Up', TO_DATE(2007, 'YYYY'), 752 FROM dual UNION ALL
    SELECT 443, 'Fearless', TO_DATE(2008, 'YYYY'), 97 FROM dual UNION ALL
    SELECT 632, 'American IV - The man Comes Around', null, 65 FROM dual UNION ALL
    SELECT 685, 'hits! The Very Best of Erasure',null, 98 FROM dual 

)

SELECT p.album_id, p.title, p.year, p.artist_id FROM p;




INSERT INTO
tracks
(
    track_id,
    name,
    milliseconds,
    artist_id,
    album_id,
    genre_id,
    play_count,
    skip_count,
    composer,
    track_index,
    bytes,
    unit_price,
    media_type_id
)
WITH b AS
(
    SELECT 18 AS track_id, 'Hurt' AS name, 219000 AS milliseconds, 65 AS artis_id, 632 AS album_id, 11 AS genre_id, 32 AS play_count, 0 AS skip_count, null AS composer, 2 AS track_index, 3879731 AS bytes, 0 AS unit_price, 1 AS media_type_id FROM dual UNION ALL
    SELECT 24, 'Make You Smile', 225000, 28, 89, 3, 81, 3, null, null, 1992294, 0.99, 4 FROM dual UNION ALL
    SELECT 25, 'La Migra (Mas Espanol)', 174000, 55, 348, 3, 55, 0, null, 12, 2936013, 0.99, 4 FROM dual UNION ALL
    SELECT 34, 'Stars Come Out(Dillon Francis Remix)', 249000, 737, 200, 12, 5, 1, null, 1, 6291456, 0, 3 FROM dual UNION ALL
    SELECT 37, 'Christmas Eve Montage', 226000, 22, 85, 6, 15, 0, null, 15, 7864320, 0, 3 FROM dual UNION ALL
    SELECT 60, 'Please Dont Leave Me', 232000, 38, 176, 2, 1, 2, 'P!nk' ||'&'|| 'Max Martin', 5, 8703181, 0.99, 6 FROM dual UNION ALL
    SELECT 148, 'Shiver', 202000, 733, 192, 21, 12, 1, null, 1, 3460301, 0, 1 FROM dual UNION ALL
    SELECT 171, 'Promises', 257000, 119, 178, 14, 5, 0, null, 1, 8703181, 0, 1 FROM dual UNION ALL
    SELECT 184, 'Dont Let Me Get Me (Radio Edit)', 211000, 38, 332, 2, 0, 1, 'P!nk' ||'&'|| 'Dallas Austin', 2, 8178893, 0.99, 4 FROM dual UNION ALL
    SELECT 202, 'Running Out Of Angels(Demo)', 125000, 127, 186, 3, 69, 0, null, null, 1153434, 0.99, 4 FROM dual UNION ALL
    SELECT 236, 'Tempt My Trouble', 194000, 48, 342, 4, 8, 0, null, 1, 8283750, 1.99, 4 FROM dual UNION ALL
    SELECT 289, 'White Horse', 234000, 97, 443, 11, 0, 3, null, 5, 8703181, 0.99, 4 FROM dual UNION ALL
    SELECT 301, 'The Bog (Radio Mix)', 243000, 12, 74, 5, 70, 0, null, null, 2097152, 0, 1 FROM dual UNION ALL
    SELECT 344, 'Seether', 197000, 732, 191, 3, 13, 0, 'Nina Gordon', 3, 3670016, 0, 1 FROM dual UNION ALL
    SELECT 346, 'Untouched', 255000, 752, 435, 2, 42, 0, 'Toby Gad, Jessica Origliasso' ||'&'|| 'Lisa Origliasso', 1, 4508877, 0.99, 6 FROM dual UNION ALL
    SELECT 390, '!Purple (Sasha v. The Light', 495000, 120, 179, 19, 60, 1, null, null, 8283750, 0, 1 FROM dual UNION ALL
    SELECT 391, 'Feel Good Inc (Single)', 221000, 46, 340, 4, 54, 0, null, 1, 3774874, 0.99, 6 FROM dual UNION ALL
    SELECT 759, 'Charlotte Sometimes (Single)', 253000, 13, 84, 3, 63, 0, null, 1, 2202010, 0, 1 FROM dual UNION ALL
    SELECT 788, 'Solsbury Hill', 259000, 98, 685, 8, 66, 0, null, null, 2306867, 0, 1 FROM dual UNION ALL
    SELECT 798, 'For A Pessimist, Im Pretty Optimistic', 217000, 32, 93, 3, 68, 0, null, null, 1992294, 0.90, 4 FROM dual UNION ALL
    SELECT 31611, 'Soul Meets Body', 231000, 95, 198, 3, 65, 0, null, null, 1992294, 0, 1 FROM dual UNION ALL
    SELECT 43173, 'Twas the Night Before Xmas', 248000, 126, 185, 3, 11, 0, null, null, 4194304, 0, 1 FROM dual 


)

SELECT b.track_id, b.name, b.milliseconds, b.artis_id, b.album_id, b.genre_id, b.play_count, b.skip_count, b.composer,b.track_index, b.bytes, b.unit_price, b.media_type_id FROM b;






