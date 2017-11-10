

puts "Creo Univeridad"
University.find_or_create_by(name: "UNLP", province: "Buenos Aires", url:"unlp.edu.ar")
University.find_or_create_by(name: "UBA", province: "Capital Federal", url:"uba.edu.ar")

puts "Creo Niveles"
Level.find_or_create_by(name: "Junior", points: 10)
Level.find_or_create_by(name: "Senior", points: 100)

puts "Creo Acciones"
Action.find_or_create_by(name: "Votar Positvo", points: 3)
Action.find_or_create_by(name: "Votar Negativo", points: -1)

puts "Creo Etiqueta"
Label.find_or_create_by(title: "Ingenieria", active: true)
Label.find_or_create_by(title: "Electronica", active: false)

puts "Creo Notificaciones"
Notification.find_or_create_by(body: "Notificaion 1", user_id: 3, read:true)
Notification.find_or_create_by(body: "Notificaion 2", user_id: 3, read:false)
Notification.find_or_create_by(body: "Notificaion 3", user_id: 3, read:false)
Notification.find_or_create_by(body: "Notificaion 1", user_id: 2, read:false)

puts "Se crean los usuarios Lucas, Mono, Vincent"
User.find_or_create_by(name: "Lucas", lastname: "Camino", email: "lucasca95@yahoo.com.ar", encrypted_password:"$2a$11$yNE4dSUocnYHtUlqkVW9JuU1fB/0hORgTdKm08N.4oRAd8dZAUAoW", points: 10, university_id: 0, level_id: 1)
User.find_or_create_by(name: "Lihuen", lastname: "Figueroa", email: "tumonitosexy@msn.com.ar", encrypted_password:"$2a$11$yNE4dSUocnYHtUlqkVW9JuU1fB/0hORgTdKm08N.4oRAd8dZAUAoW", points: 10, university_id: 0, level_id: 1)
User.find_or_create_by(name: "Vincent", lastname: "Corrao", email: "licenciado@iscl.com.mx", encrypted_password:"$2a$11$yNE4dSUocnYHtUlqkVW9JuU1fB/0hORgTdKm08N.4oRAd8dZAUAoW", points: 10, university_id: 1, level_id: 1)

puts "Creo Pregunta"
Question.find_or_create_by(title: "¿Que hace Ruby?", body: "Serian tan amables de contrame lo que hace ruby?", user_id: 3)

puts "Creo Respuesta"
Answer.find_or_create_by(body: "La verdad que preguntas como el culo", user_id: 3, question_id:1)

puts "Creo Comentarios"
Comment.find_or_create_by(body: "Comento Pregunta", user_id: 3, commentable_id: 1, commentable_type: "Question")
Comment.find_or_create_by(body: "Comento Respuesta", user_id: 3, commentable_id: 1, commentable_type: "Answer")

puts "Creo Denuncias"
Report.find_or_create_by(reason: "Denuncia Pregunta", user_id: 3, reportable_id: 1, reportable_type: "Question")
Report.find_or_create_by(reason: "Denuncia Respuesta", user_id: 3, reportable_id: 1, reportable_type: "Answer")
Report.find_or_create_by(reason: "Denuncia Comentario", user_id: 3, reportable_id: 1, reportable_type: "Comment")

puts "Creo Votos"
Vote.find_or_create_by(user_id: 2, votable_id: 1, votable_type: "Question", like:true)
Vote.find_or_create_by(user_id: 2, votable_id: 1, votable_type: "Answer", like:true)
Vote.find_or_create_by(user_id: 2, votable_id: 1, votable_type: "Comment", like:true)
Vote.find_or_create_by(user_id: 1, votable_id: 1, votable_type: "Answer", like:false)
Vote.find_or_create_by(user_id: 1, votable_id: 1, votable_type: "Question", like:false)
Vote.find_or_create_by(user_id: 1, votable_id: 1, votable_type: "Comment", like:false)
Vote.find_or_create_by(user_id: 1, votable_id: 2, votable_type: "Comment", like:false)
Vote.find_or_create_by(user_id: 2, votable_id: 2, votable_type: "Comment", like:true)