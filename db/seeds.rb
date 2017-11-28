

puts "Creo Univeridad"
University.find_or_create_by(name: "UNLP", province: "Buenos Aires", url:"unlp.edu.ar")
University.find_or_create_by(name: "UBA", province: "Capital Federal", url:"uba.edu.ar")
University.find_or_create_by(name: "SinUniversidad", province: "SinUniversidad", url:"SinUniversidad")


puts "Creo Niveles"
level_1=Level.find_or_create_by(name: "Senior", points: 100)
level_2=Level.find_or_create_by(name: "Administrador", points: 1000)
level_3=Level.find_or_create_by(name: "Junior", points: 10)



puts "Creo Acciones"
#Acciones de administador
#action_01=Action.find_or_create_by(name: "Crear Facultad", points: 0)
#action_02=Action.find_or_create_by(name: "Crear Nivel", points: 0)
#action_06=Action.find_or_create_by(name: "Crear Etiqueta", points: 0)
#action_09=Action.find_or_create_by(name: "Editar Nivel", points: 0)
#action_08=Action.find_or_create_by(name: "Editar Facultad", points: 0)
#action_13=Action.find_or_create_by(name: "Editar Etiqueta", points: 0)
#action_15=Action.find_or_create_by(name: "Borrar Facultad", points: 0)
#action_16=Action.find_or_create_by(name: "Borrar Nivel", points: 0)
#ction_20=Action.find_or_create_by(name: "Borrar Etiqueta", points: 0)
#RESUMIDAS EN:
action_01=Action.find_or_create_by(name: "Administrar", points: 0)

#Acciones de usuario logueado
action_02=Action.find_or_create_by(name: "Crear Pregunta", points: 1)
action_03=Action.find_or_create_by(name: "Crear Respuesta", points: 2)
action_04=Action.find_or_create_by(name: "Crear Comentario", points: 3)
action_05=Action.find_or_create_by(name: "Crear Usuario", points: 0)
action_06=Action.find_or_create_by(name: "Editar Pregunta", points: 0)
action_07=Action.find_or_create_by(name: "Editar Respuesta", points: 0)
action_08=Action.find_or_create_by(name: "Editar Comentario", points: 0)
action_09=Action.find_or_create_by(name: "Editar Usuario", points: 0)
action_10=Action.find_or_create_by(name: "Borrar Pregunta", points: 0)
action_11=Action.find_or_create_by(name: "Borrar Respuesta", points: 0)
action_12=Action.find_or_create_by(name: "Borrar Comentario", points: 0)
action_13=Action.find_or_create_by(name: "Borrar Usuario", points: 0)
action_14=Action.find_or_create_by(name: "Votar Pregunta Positivo", points: 4)
action_15=Action.find_or_create_by(name: "Votar Respuesta Positivo", points: 5)
action_16=Action.find_or_create_by(name: "Votar Comentario Positivo", points: 6)
action_17=Action.find_or_create_by(name: "Votar Pregunta Negativo", points: 4)
action_18=Action.find_or_create_by(name: "Votar Respuesta Negativo", points: 5)
action_19=Action.find_or_create_by(name: "Votar Comentario Negativo", points: 6)
action_20=Action.find_or_create_by(name: "Comentar Pregunta", points: 7)
action_21=Action.find_or_create_by(name: "Comentar Respuesta", points: 8)
action_22=Action.find_or_create_by(name: "Responder Pregunta", points: 9)
action_23=Action.find_or_create_by(name: "Denunciar Pregunta", points: 10)
action_24=Action.find_or_create_by(name: "Denunciar Respuesta", points: 11)
action_25=Action.find_or_create_by(name: "Denunciar Comentario", points: 12)

#Level 2 es admin
level_2.actions << action_01
#Y tiene el resto de los permisos
level_2.actions << action_02
level_2.actions << action_03
level_2.actions << action_04
level_2.actions << action_05
level_2.actions << action_06
level_2.actions << action_07
level_2.actions << action_08
level_2.actions << action_09
level_2.actions << action_10
level_2.actions << action_11
level_2.actions << action_12
level_2.actions << action_13
level_2.actions << action_14
level_2.actions << action_15
level_2.actions << action_16
level_2.actions << action_17
level_2.actions << action_18
level_2.actions << action_19
level_2.actions << action_20
level_2.actions << action_21
level_2.actions << action_22
level_2.actions << action_23
level_2.actions << action_24
level_2.actions << action_25


#Level1 no es admin, pero tiene el resto de los permisos
level_1.actions << action_02
level_1.actions << action_03
level_1.actions << action_04
level_1.actions << action_05
level_1.actions << action_06
level_1.actions << action_07
level_1.actions << action_08
level_1.actions << action_09
level_1.actions << action_10
level_1.actions << action_11
level_1.actions << action_12
level_1.actions << action_13
level_1.actions << action_14
level_1.actions << action_15
level_1.actions << action_16
level_1.actions << action_17
level_1.actions << action_18
level_1.actions << action_19
level_1.actions << action_20
level_1.actions << action_21
level_1.actions << action_22
level_1.actions << action_23
level_1.actions << action_24
level_1.actions << action_25

#Level 3 no tiene ningun permiso






puts "Creo Etiqueta"
etiqueta_ingenieria=Label.find_or_create_by(title: "INGENIERIA", active: true)
etiqueta_electronica=Label.find_or_create_by(title: "ELECTRONICA", active: true)
etiqueta_electronica=Label.find_or_create_by(title: "INFORMATICA", active: true)
etiqueta_electronica=Label.find_or_create_by(title: "EDUCACION", active: true)
etiqueta_electronica=Label.find_or_create_by(title: "FISICA", active: true)
etiqueta_electronica=Label.find_or_create_by(title: "QUIMICA", active: true)


puts "Se crean los usuarios Lucas, Mono, Vincent"

User.create(name: "Lucas", lastname: "Camino", email: "lucas@cfc.com", password:"12345678", points: 99999, university_id: 1, level_id: 2)
User.create(name: "Lihuen", lastname: "Figueroa", email: "mono@cfc.com", password:"12345678", points: 99999, level_id: 2)
User.create(name: "Vincent", lastname: "Corrao", email: "santi@cfc.com", password:"12345678", points: 99999, university_id: 1, level_id: 2)
User.create(name: "Giordano", lastname: "Oxygen", email: "giordano@educanding.com", password:"12345678", points: 10, level_id: 1)
User.create(name: "Martin", lastname: "Galan", email: "martingalan@gmail.com", password:"12345678", points: 10, university_id: 3,level_id: 3)

puts "Creo Notificaciones"
Notification.find_or_create_by(body: "Notificaion 1", user_id: 3, read:true)
Notification.find_or_create_by(body: "Notificaion 2", user_id: 3, read:false)
Notification.find_or_create_by(body: "Notificaion 3", user_id: 3, read:false)
Notification.find_or_create_by(body: "Notificaion 1", user_id: 2, read:false)

puts "Creo Pregunta"
pregunta_1=Question.find_or_create_by(title: "¿Que hace Ruby?", body: "Serian tan amables de contrame lo que hace ruby?", user_id: 1)
pregunta_1.labels << etiqueta_ingenieria
puts "Creo Respuesta"
Answer.find_or_create_by(body: "La verdad que preguntaste cualquier cosa", user_id: 2, question_id:1)
ans1 = Answer.find_or_create_by(body: "La verdad que preguntaste cualquier cosa2", user_id: 3, question_id:1)
pregunta_1.answer = ans1
pregunta_1.save
puts "Creo Comentarios"
Comment.find_or_create_by(body: "Ruby no hace nada", user_id: 2, commentable_id: 1, commentable_type: "Question")
Comment.find_or_create_by(body: "Tu respuesta fue algo ofensiva, no te parece?", user_id: 1, commentable_id: 1, commentable_type: "Answer")

puts "Creo Denuncias"
Report.find_or_create_by(reason: "Denuncia Pregunta", user_id: 3, reportable_id: 1, reportable_type: "Question")
Report.find_or_create_by(reason: "Denuncia Respuesta", user_id: 3, reportable_id: 1, reportable_type: "Answer")
Report.find_or_create_by(reason: "Denuncia Comentario", user_id: 3, reportable_id: 1, reportable_type: "Comment")

puts "Creo Votos"
Vote.find_or_create_by(user_id: 2, votable_id: 1, votable_type: "Question", like:true)
Vote.find_or_create_by(user_id: 2, votable_id: 1, votable_type: "Answer", like:true)
Vote.find_or_create_by(user_id: 1, votable_id: 1, votable_type: "Answer", like:false)
Vote.find_or_create_by(user_id: 1, votable_id: 1, votable_type: "Question", like:false)
