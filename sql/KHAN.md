//KHAN ACADEMY BASIC

CREATE TABLE books (id INTEGER PRIMARY KEY, name TEXT, rating INTEGER);

INSERT INTO books (name, rating) VALUES ("Harry Potter", 6);
INSERT INTO books (name, rating) VALUES ("Left Behind", 9);
INSERT INTO books (name, rating) VALUES ("Dictionary", 8);

CREATE TABLE movies (id INTEGER PRIMARY KEY, name TEXT, release_year INTEGER);  
INSERT INTO movies VALUES (1, "Avatar", 2009);
INSERT INTO movies VALUES (2, "Titanic", 1997);
INSERT INTO movies VALUES (3, "Star Wars: Episode IV - A New Hope", 1977);
INSERT INTO movies VALUES (4, "Shrek 2", 2004);
INSERT INTO movies VALUES (5, "The Lion King", 1994);
INSERT INTO movies VALUES (6, "Disney's Up", 2009);

SELECT * FROM movies;
SELECT * FROM movies WHERE release_year > 2000 ORDER BY release_year ASC

CREATE TABLE todo_list (id INTEGER PRIMARY KEY, item TEXT, minutes INTEGER);
INSERT INTO todo_list VALUES (1, "Wash the dishes", 15);
INSERT INTO todo_list VALUES (2, "vacuuming", 20);
INSERT INTO todo_list VALUES (3, "Learn some stuff on KA", 30);
INSERT INTO todo_list VALUES (4, "Cook", 30);

SELECT SUM(minutes) FROM todo_list;

CREATE TABLE store (id INTEGER PRIMARY KEY, clothing TEXT, price REAL, stock INTEGER, color TEXT, size TEXT);

INSERT INTO store VALUES (1, "jeans", 4.99, 10, "RED", "L");
INSERT INTO store VALUES (2, "shirt", 544.99, 10, "BLUE", "XXL");
INSERT INTO store VALUES (3, "tie", 49.99, 10, "RED", "M");
INSERT INTO store VALUES (4, "socks", 9.99, 10, "YELLOW", "L");
INSERT INTO store VALUES (5, "boxers", 22.99, 10, "GREEN", "M");
INSERT INTO store VALUES (6, "suit", 5.99, 10, "BLUE", "S");
INSERT INTO store VALUES (7, "jacket", 87.99, 10, "BLUE", "L");
INSERT INTO store VALUES (8, "dress", 14.99, 10, "BLUE", "S");
INSERT INTO store VALUES (9, "overall", 74.99, 10, "RED", "L");
INSERT INTO store VALUES (10, "coat", 94.99, 10, "YELLOW", "S");
INSERT INTO store VALUES (11, "shorts", 40.99, 10, "BLACK", "M");
INSERT INTO store VALUES (12, "sweats", 46.99, 10, "RED", "XS");
INSERT INTO store VALUES (13, "PJ", 4.99, 10, "BLUE", "XS");
INSERT INTO store VALUES (14, "hat", 6.99, 10, "GREEN", "L");
INSERT INTO store VALUES (15, "shoes", 5.99, 10, "BLUE", "XL");

SELECT clothing, price FROM store ORDER BY price;


//KHAN ACADEMY ADV


SELECT title FROM songs;

SELECT title FROM songs WHERE mood = "epic" OR released > 1990;

SELECT title FROM songs WHERE mood = "epic" AND released > 1990 AND duration < 240;

SELECT title FROM songs WHERE  artist = "Queen";

SELECT name FROM artists WHERE genre = "Pop";

SELECT title FROM songs WHERE artist IN (
SELECT name FROM artists WHERE genre = "Pop");

SELECT author, SUM(words) AS total_words FROM books
    GROUP BY author
    HAVING total_words > 1000000;

SELECT author, AVG(words) as avg_words
FROM books
    GROUP BY author
    HAVING avg_words > 150000;




SELECT name, number_grade, ROUND(fraction_completed * 100) AS percent_completed FROM student_grades;

SELECT COUNT( * ),
        CASE
        WHEN number_grade > 90 THEN "A"
        WHEN number_grade > 80 THEN "B"
        WHEN number_grade > 70 THEN "C"
        ELSE "F"
        END AS "letter_grade"
        FROM student_grades
        GROUP BY letter_grade;



SELECT country, population FROM countries_by_population WHERE population > 100000000;

      SELECT country,
            CASE
                WHEN density_per_sq_km < 50 THEN "LOW DENSITY"
                WHEN density_per_sq_km > 50
                THEN "HIGH DENSITY"
                END as "DEnsity"
                FROM countries_by_population;

                CREATE TABLE customers (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    name TEXT,
                    email TEXT);

                INSERT INTO customers (name, email) VALUES ("Doctor Who", "doctorwho@timelords.com");
                INSERT INTO customers (name, email) VALUES ("Harry Potter", "harry@potter.com");
                INSERT INTO customers (name, email) VALUES ("Captain Awesome", "captain@awesome.com");

                CREATE TABLE orders (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    customer_id INTEGER,
                    item TEXT,
                    price REAL);

                INSERT INTO orders (customer_id, item, price)
                    VALUES (1, "Sonic Screwdriver", 1000.00);
                INSERT INTO orders (customer_id, item, price)
                    VALUES (2, "High Quality Broomstick", 40.00);
                INSERT INTO orders (customer_id, item, price)
                    VALUES (1, "TARDIS", 1000000.00);

                SELECT customers.name, customers.email, orders.item, orders.price
                FROM customers
                LEFT OUTER JOIN orders
                ON customers.id = orders.customer_id;

                SELECT customers.name, customers.email, SUM(orders.price)
                FROM customers
                JOIN orders
                ON
                customers.id = orders.customer_id
                GROUP BY name;


SELECT persons.name, hobbies.name FROM persons
JOIN hobbies
ON persons.id = person_id;

SELECT persons.name, hobbies.name FROM persons
JOIN hobbies
ON persons.id = person_id
WHERE persons.name = 'Bobby McBobbyFace';


SELECT movies.title, buddy.title FROM movies
LEFT OUTER JOIN movies buddy
ON movies.sequel_id = buddy.id;


SELECT persons.fullname, hobbies.name FROM persons
JOIN hobbies
ON persons.id = hobbies.person_id;

SELECT a.fullname, b.fullname FROM friends
    JOIN persons a
    ON friends.person1_id = a.id
    JOIN persons b
    ON friends.person2_id = b.id;


    CREATE TABLE actors (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);

    INSERT INTO actors (name) VALUES ("james");
    INSERT INTO actors (name) VALUES ("tommy");
    INSERT INTO actors (name) VALUES ("hank");
    INSERT INTO actors (name) VALUES ("jack");
    INSERT INTO actors (name) VALUES ("jas");
    INSERT INTO actors (name) VALUES ("red");
    INSERT INTO actors (name) VALUES ("jasmine");
    INSERT INTO actors (name) VALUES ("jeff");

    CREATE TABLE hobbies (id INTEGER PRIMARY KEY AUTOINCREMENT, hobby TEXT);

    INSERT INTO hobbies (hobby) VALUES ("eating");
    INSERT INTO hobbies (hobby) VALUES ("cleaning");
    INSERT INTO hobbies (hobby) VALUES ("reading");
    INSERT INTO hobbies (hobby) VALUES ("washing");
    INSERT INTO hobbies (hobby) VALUES ("tv");
    INSERT INTO hobbies (hobby) VALUES ("cooking");
    INSERT INTO hobbies (hobby) VALUES ("biking");
    INSERT INTO hobbies (hobby) VALUES ("reading");
    INSERT INTO hobbies (hobby) VALUES ("sleeping");

    SELECT actors.name, hobbies.hobby FROM
    actors
    JOIN hobbies
    ON actors.id = hobbies.id;



    SELECT * FROM documents;

    UPDATE documents SET author = "Jackie Draper" WHERE author = "Jackie Paper";

    SELECT * FROM documents;

    DELETE FROM documents WHERE title = "Things I'm Afraid Of";

    SELECT * FROM documents;

    CREATE TABLE clothes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    type TEXT,
    design TEXT);

INSERT INTO clothes (type, design)
    VALUES ("dress", "pink polka dots");
INSERT INTO clothes (type, design)
    VALUES ("pants", "rainbow tie-dye");
INSERT INTO clothes (type, design)
    VALUES ("blazer", "black sequin");

ALTER TABLE clothes ADD price REAL default "0";

SELECT * FROM clothes;

UPDATE clothes SET price = 10 WHERE id = 1;
UPDATE clothes SET price = 20 WHERE id = 2;
UPDATE clothes SET price = 30 WHERE id = 3;

SELECT * FROM clothes;

INSERT INTO clothes (type, design, price) VALUES ("suit", "yellow", 10.00);

SELECT * FROM clothes;

What does the app's SQL look like?

CREATE TABLE workout (id INTEGER PRIMARY KEY AUTOINCREMENT, type TEXT, duration INTEGER);

INSERT INTO workout (type, duration) VALUES ("running", 10);
INSERT INTO workout (type, duration) VALUES ("biking", 12);
INSERT INTO workout (type, duration) VALUES ("swimming", 9);
INSERT INTO workout (type, duration) VALUES ("walking", 8);
INSERT INTO workout (type, duration) VALUES ("lifting", 5);
INSERT INTO workout (type, duration) VALUES ("tennis", 2);
INSERT INTO workout (type, duration) VALUES ("basketball", 100);

SELECT * FROM workout;

UPDATE workout SET type = "sleeping" WHERE id = 2;

SELECT * FROM workout;

DELETE FROM workout WHERE type = "basketball";

SELECT * FROM workout;
