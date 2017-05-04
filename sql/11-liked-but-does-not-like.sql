11: For every situation where student A likes student B,
but we have no information about whom B likes
(that is, B's id does not appear in the liker_id column of the like table),
 return A and B's names and grades.
Write the SQL in the file sql/11-liked-but-does-not-like.sql

SELECT a.name, a.grade, b.name, b.grade
FROM ex.student_list
JOIN ex.student a ON a.id = ex.student_like.liker_id
JOIN ex.student b ON b.id = ex.student_like.likee_id
WHERE b.id NOT IN (SELECT liker_id FROM ex.student_like)
