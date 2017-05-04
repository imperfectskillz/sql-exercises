07: Find the names of all students who are friends with someone named Gabriel.
Write the SQL in the file sql/07-query-friends-gabriel.sql

SELECT a.name, b.name FROM ex.friend JOIN ex.student a ON a.id = ex.friend.id1 JOIN ex.student b ON b.id = ex.friend.id2 WHERE a.name ='Gabriel' or b.name = 'Gabriel'
