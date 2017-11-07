Tutorial proyecto educanding

Creación de un modelo:
	rails generate model "nombre_del_modelo_singular_minuscula" "nombre_col1" "nombre_col2" "nombre_col3" (etc). 
	Si alguna columna no es string, se debe indicar explícitamente el tipo; por ejemplo "edad:integer".

Creación de un controlador/vistaAsociada:
	rails generate controller "nombre_del_controlador_minuscula_plural" parámetro1. Parámetro1 puede ser por ejemplo "index". Si ejecuto "rails generate controller personas index" me creará el controlador personas con el método index adentro en vacío.

Sobre rutas:
	- Las rutas se configuran en (...)/config/routes.rb 
	- El comando "root :to => 'inicio#index'" establece la vista <index> del controlador <inicio> como principal, al momento de abrir la página.
	- El comando "rake routes": nos muestra las rutas que existen en el sistema
	- El comando "resources :nombre_controlador" crea todas las rutas por defecto a cada método del controlador indicado
	- Si queremos agregar rutas propias porque no nos sirven las que son por defecto, entonces en el archivo <routes.rb> ponemos "get /<url>, to:'<nombreControlador#nombreMétodo>'". Esto nos permite llamar desde código ruby al metodo del controlador deseado mediante "<url>_path"

Sobre migraciones: Son las relaciones entre un modelo de datos y la base de datos.
	- Se crean automágicamente con los campos seteados como columnas al momento de crear un modelo (ver comando de creación de modelo).
	- Para poder ver las tablas creadas por los archivos migrate se debe ejecutar "rake db:migrate"