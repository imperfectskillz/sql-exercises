09: For every pair of students who both like each other,
return the name and grade of both students.
Include each pair only once, with the two names in alphabetical order.
Write the SQL in the file sql/09-mutual-likes.sql


 SELECT liker.name AS liker_name, liker.grade AS liker_grade,
  likee.name AS likee_name, likee.grade AS likee_grade
  FROM
 (SELECT a.liker_id, a.likee_id
			FROM ex.student_like a
			JOIN ex.student_like b
			ON a.liker_id = b.likee_id AND b.liker_id = a.likee_id) mutual
    JOIN ex.student AS liker ON liker.id = mutual.liker_id
    JOIN ex.student AS likee ON likee.id = mutual.likee_id
WHERE liker.name < likee.name
ORDER BY liker.name ASC
