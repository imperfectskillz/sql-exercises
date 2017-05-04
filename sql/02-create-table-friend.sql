CREATE TABLE friend (
  id1 INTEGER REFERENCE student(id),
  id2 INTEGER REFERENCE student(id)
  )
