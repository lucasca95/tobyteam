

puts "Creo Universidad"
University.find_or_create_by(name: "UNLP", province: "BUENOS AIRES", url:"unlp.edu.ar")
University.find_or_create_by(name: "UBA", province: "CAPITAL FEDERAL", url:"uba.edu.ar")


puts "Creo Niveles"
level_1=Level.find_or_create_by(name: "Modificar contenido", points: 1000)
level_2=Level.find_or_create_by(name: "Administrar facultades", points: 500)
level_3=Level.find_or_create_by(name: "Administrar etiquetas", points: 300)
level_4=Level.find_or_create_by(name: "Votar negativo", points: 100)
level_5=Level.find_or_create_by(name: "Comentar", points: 20)
level_6=Level.find_or_create_by(name: "Votar Positivo", points: 15)
level_7=Level.find_or_create_by(name: "Inicial", points: 1)


puts "Creo Acciones"

#RESUMIDAS EN:
action_01=Action.find_or_create_by(name: "Administrar", points: 0)
action_02=Action.find_or_create_by(name: "Administrar Etiquetas", points: 0)
action_03=Action.find_or_create_by(name: "Administrar Univeridades", points: 0)
#Acciones de usuario logueado
action_04=Action.find_or_create_by(name: "Crear Pregunta", points: 0)
action_05=Action.find_or_create_by(name: "Crear Respuesta", points: 0)
action_06=Action.find_or_create_by(name: "Crear Comentario", points: 0)

action_07=Action.find_or_create_by(name: "Editar Pregunta", points: 0)
action_08=Action.find_or_create_by(name: "Editar Respuesta", points: 0)
action_09=Action.find_or_create_by(name: "Editar Comentario", points: 0)
action_10=Action.find_or_create_by(name: "Editar Usuario", points: 0)

action_11=Action.find_or_create_by(name: "Borrar Pregunta", points: 0)
action_12=Action.find_or_create_by(name: "Borrar Respuesta", points: 0)
action_13=Action.find_or_create_by(name: "Borrar Comentario", points: 0)
action_14=Action.find_or_create_by(name: "Borrar Usuario", points: 0)

action_15=Action.find_or_create_by(name: "Votar Pregunta Positivo", points: 5)
action_16=Action.find_or_create_by(name: "Votar Respuesta Positivo", points: 10)

action_17=Action.find_or_create_by(name: "Votar Pregunta Negativo", points: 2)
action_18=Action.find_or_create_by(name: "Votar Respuesta Negativo", points: 2)

action_19=Action.find_or_create_by(name: "Comentar Pregunta", points: 0)
action_20=Action.find_or_create_by(name: "Comentar Respuesta", points: 0)

action_22=Action.find_or_create_by(name: "Responder Pregunta", points: 0)

action_23=Action.find_or_create_by(name: "Denunciar Pregunta", points: 0)
action_24=Action.find_or_create_by(name: "Denunciar Respuesta", points: 0)
action_25=Action.find_or_create_by(name: "Denunciar Comentario", points: 0)

action_26=Action.find_or_create_by(name: "Mejor Respuesta", points: 20)

action_27=Action.find_or_create_by(name: "Accion Negativa", points: 1)

#Level 2 es admin
level_7.actions << action_04
level_7.actions << action_05

#Y tiene el resto de los permisos
level_6.actions << level_7.actions
level_6.actions << action_15
level_6.actions << action_16

level_5.actions << level_6.actions
level_5.actions << action_19
level_5.actions << action_20

level_4.actions << level_5.actions
level_4.actions << action_17
level_4.actions << action_18

level_3.actions << level_4.actions
level_3.actions << action_02

level_2.actions << level_3.actions
level_2.actions << action_03

level_1.actions << Action.all

puts "Creo Etiqueta"
etiqueta_ingenieria=Label.find_or_create_by(title: "INGENIERIA", active: true)
etiqueta_electronica=Label.find_or_create_by(title: "ELECTRONICA", active: true)
etiqueta_informatica=Label.find_or_create_by(title: "INFORMATICA", active: true)
etiqueta_educacion=Label.find_or_create_by(title: "EDUCACION", active: true)
etiqueta_fisica=Label.find_or_create_by(title: "FISICA", active: true)
etiqueta_quimica=Label.find_or_create_by(title: "QUIMICA", active: true)
etiqueta_offtopic=Label.find_or_create_by(title: "OFFTOPIC", active: true)

puts "Se crean los usuarios Lucas, Mono, Vincent"

User.create(name: "Lucas", lastname: "Camino", email: "lucas@cfc.com", password:"12345678", points: 99999, university_id: 1, level_id: 1)
User.create(name: "Lihuen", lastname: "Figueroa", email: "mono@cfc.com", password:"12345678", points: 99999, level_id: 1)
User.create(name: "Vincent", lastname: "Corrao", email: "santi@cfc.com", password:"12345678", points: 99999, university_id: 1, level_id: 1)
User.create(name: "Giordano", lastname: "Oxygen", email: "giordano@educanding.com", password:"12345678", points: 1, level_id: 3)
User.create(name: "Martin", lastname: "Galan", email: "martingalan@gmail.com", password:"12345678", points: 1, university_id: 3,level_id: 7)

puts "Creo Notificaciones"
Notification.find_or_create_by(body: "Notificaion 1", user_id: 3, read:true)
Notification.find_or_create_by(body: "Notificaion 2", user_id: 3, read:false)
Notification.find_or_create_by(body: "Notificaion 3", user_id: 3, read:false)
Notification.find_or_create_by(body: "Notificaion 1", user_id: 2, read:false)

puts "Creo Pregunta"
pregunta_1=Question.find_or_create_by(title: "¿Que hace Ruby?", body: "Serian tan amables de contrame lo que hace ruby?", user_id: 1, created_at: "2016-12-13 16:24:59 UTC")
pregunta_1.labels << etiqueta_informatica
pregunta_2=Question.find_or_create_by(title: "¿Como se construye un puente?", body: "Estudié ingenieria pero no me acuerdo como es..", user_id: 2)
pregunta_2.labels << etiqueta_ingenieria
pregunta_3=Question.find_or_create_by(title: "Represa Hidroelectrica", body: "Necesito un plano para hacer una en casa :|", user_id: 3)
pregunta_3.labels << etiqueta_ingenieria
pregunta_4=Question.find_or_create_by(title: "Encender un led", body: "Amigos. Necesito saber como se hacen las cuentas para que un led no se queme. Saludos", user_id: 3, created_at: "2015-08-09 13:30:14 UTC")
pregunta_4.labels << etiqueta_electronica
pregunta_5=Question.find_or_create_by(title: "RANDOM", body: "¿Cuánto osigeno ehhh le quita realmente un auto, una combustión de un auto, ehhh equivale ehhh a cuántos árboles se necesitan para ehhh ehhh evitar justamente que el árbol que da osígeno ehhh indudablemente uno en la montaña cuando ve realmente que no hay ningún árbol es que no hay osígeno, quiere decir que falta osígeno ahí en la montaña que vos me dijiste en otra oportunidad. Qué pasa cuánto equivale el los gases y la y lo que le quita osígeno ehhh comparado con la cantidad de áboles que haría falta para combatir ehhh ehhh la combustión de un auto ehh que está obsoleto como dijiste vos que tiene más de 120 años que le quita osígeno?", user_id: 4)
pregunta_5.labels << etiqueta_offtopic

puts "Creo Respuesta"
Answer.find_or_create_by(body: "La verdad que preguntaste cualquier cosa", user_id: 2, question_id:1)

ans1 = Answer.find_or_create_by(body: "La verdad que preguntaste cualquier cosa2", user_id: 3, question_id:1)
pregunta_1.answer = ans1
pregunta_1.save
Answer.find_or_create_by(body: "Son 32.435.123.435 Litros de oxigeno", user_id: 3, question_id:5)

puts "Creo Comentarios"
Comment.find_or_create_by(body: "Ruby no hace nada", user_id: 2, commentable_id: 1, commentable_type: "Question")
Comment.find_or_create_by(body: "Tu respuesta fue algo ofensiva, no te parece?", user_id: 1, commentable_id: 1, commentable_type: "Answer")
Comment.find_or_create_by(body: "La verdad que me esta costando un poco entender tu pregunta", user_id: 2, commentable_id: 5, commentable_type: "Question")

puts "Creo Denuncias"
Report.find_or_create_by(reason: "Denuncia Pregunta", user_id: 3, reportable_id: 1, reportable_type: "Question")
Report.find_or_create_by(reason: "Denuncia Respuesta", user_id: 3, reportable_id: 1, reportable_type: "Answer")
Report.find_or_create_by(reason: "Denuncia Comentario", user_id: 3, reportable_id: 1, reportable_type: "Comment")

puts "Creo Votos"
Vote.find_or_create_by(user_id: 2, votable_id: 1, votable_type: "Question", like:true)
Vote.find_or_create_by(user_id: 2, votable_id: 1, votable_type: "Answer", like:true)
Vote.find_or_create_by(user_id: 1, votable_id: 1, votable_type: "Answer", like:false)
Vote.find_or_create_by(user_id: 1, votable_id: 1, votable_type: "Question", like:false)
