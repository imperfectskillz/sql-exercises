CREATE TABLE student_like (
  liker_id INTEGER REFERENCE student(id),
  likee_id INTEGER REFERENCE student(id)
  )
