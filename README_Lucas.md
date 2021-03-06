Easy guide ruby_on_rails!

IMPORTANTE: CODIFICAR EN INGLES, para aprovechar la automagia de rails


Sobre modelos:

	-Creación rapida de un modelo:
		rails generate model "nombre_del_modelo_singular_minuscula" "nombre_col1" "nombre_col2" "nombre_col3" (etc). Si alguna columna no es string, se debe indicar explícitamente el tipo; por ejemplo "edad:integer".

	-Creacion de campo de modelo (para seed):
		op1)
			x=Modelo.new
			x.campo1="......." (si es string)
			x.campo2=.......
		op2)
			Modelo.create(col1: "valor", col2: "valor")

	Dependencias:
		has_many :"nombre_del_modelo_plural_minuscula"
		belongs_to :"nombre_del_modelo_singular_minuscula"

		Si queremos que al borrar un objeto se borre otro que dependa del borrado, hacemos:
			"class Monstruo < ActiveRecord::Base
				has_many :tweets , dependent: :destroy
			end"

	Validaciones:
		validates :"nombreColumna", "tipoDeValidacion": true

		tipos de validaciones:
			*presence:true
			*uniqueness: true
			*numericality: true
			*length: { minimum: 0, maximum: 2000 }
			*format: { with: /.*/ }
			*acceptance: true
			*confirmation: true
			
		Ejemplo de validación:	validates :edad, exclusion: { 0...20 }, message: “Debes ser mayor a 21”

	Links interesantes:
		1) https://carlossanchezperez.wordpress.com/2013/01/13/mi-guia-para-especificar-las-relaciones-en-los-modelos-active-record-rubyonrails/
		2) https://www.youtube.com/watch?v=OpRN6XAhA_M

Sobre controladores:

	-Creación rapida de un controlador/vistaAsociada:
		rails generate controller "nombre_del_controlador_minuscula_plural" parámetro1. Parámetro1 puede ser por ejemplo "index". Si ejecuto "rails generate controller personas index" me creará el controlador personas con el método index adentro en vacío.
		Metodos por defecto: index new edit update create destroy show


Sobre rutas:

	- Las rutas se configuran en (...)/config/routes.rb 
	- El comando "resources :nombre_controlador" crea todas las rutas por defecto a cada método del controlador indicado
	- El comando "root :to => 'inicio#index'" establece la vista <index> del controlador <inicio> como principal, al momento de abrir la página.
	- El comando "rake routes": nos muestra las rutas que existen en el sistema
	- Si queremos agregar rutas propias porque no nos sirven las que son por defecto, entonces en el archivo <routes.rb> ponemos "get /<url>, to:'<nombreControlador#nombreMétodo>'". Esto nos permite llamar desde código ruby al metodo del controlador deseado mediante "<url>_path"


Sobre MIGRACIONES: 

	Son las relaciones entre un modelo de datos y la base de datos.
	- Se crean automágicamente, con los campos seteados como las columnas al momento de crear un modelo (ver comando de creación de modelo).
	- Para poder ver las tablas creadas por los archivos migrate se debe ejecutar "rake db:migrate". Esto ejecutara todas las migraciones que NO HAYAN SIDO EJECUTADAS AUN.
	- Para agregar un nuevo campo a un modelo, es decir a la tabla de migraciones para dicho modelo se debe ejecutar el comando "rails generate migration <nombreDelArchivoQueControlaNuevoCampo>". Esto creara en la carpeta "db/migrations" un archivo en el que tendremos que especificar que hace esta migracion: si lo que queremos es agregar al modelo una columna, debemos escribir:
		 def change
		 	add_column :<nombreModeloEnMinusculaYPlural>, :<nombreColumnaNueva>, :<tipoDeDato>
		 end
	  Existen muchas operaciones para archivos de migraciones. Algunas son:
	  	*create_table (name, options)
	  	*drop_table (name)
	  	*rename_table (old_name, new_name)
	  	*add_column (table_name, column_name, type, options)
	  	*rename_column (table_name, column_name, new_column_name)
	  	*change_column (table_name, column_name, type, options)
	  	*remove_column (table_name, column_name)
	  	*add_index (table_name, column_name, index_type)
	  	*remove_index (table_name, column_name)

	  Comandos a la hora de trabajar con migraciones:
	  	*rake db:migrate -> (explicado arriba)
	  	*rake db:migrate VERSION=20140101022005 -> corre nuevamente la migracion especifica indicada
	  	*rake db:rollback STEP=NUM -> deshace las ultimas NUM migraciones

	  	*rake db:reset -> BORRA TODA LA BASE DE DATOS! El Server debe estar CERRADO

	  Para borrar migraciones:
	   rails d migration devise_create_users

	Importante:
	rake db:environment:set RAILS_ENV=development

Sobre formularios:

	Se guardan en archivo aparte. (_form.html.erb)
	Desde una vista se llaman haciendo:
		<%= render 'form' %>
	Adentro tienen un aspecto asi:
	<%= form_for @nombre_variable do |f| %>
		<%= f.label :"Nombre campo1: " %>
		<%= f.text_field :campo1, required: true, placeholder: ‘Ingrese contenido campo1' %>
		<%= f.label :"Nombre campo2: " %>
		<%= f.text_field :campo2 %>
		<%= f.submit 'Guardar' %>
	<% end %>

	Campo texto largo
		<%= f.text_area :campo %>
	Campo binario
		<%= f.check_box :campo %>
	Campo radio con múltiples opciones
		<%= f.radio_button :sexo, 'masc', checked: true %>
		<%= f.radio_button :sexo, 'fem' %>
		<%= f.radio_button :sexo, 'nose' %>
	Lista de opciones
		<%= f.select :pais, ['Argentina', 'Brasil', 'Jamaica'] %>
	Campo de contraseña
		<%= f.password_field :password %>
	Campo numerico
		<%= f.number_field :price %>
	Campo de ???
	<%= f.range_field :quantity %>
	Campo mail
	<%= f.email_field :email %>
	Campo URL
	<%= f.url_field :website %>
	Campo numero telefonico
	<%= f.telephone_field :mobile %>


Para loguear usuarios:
	Se usa gema "devise"
	Video interesante: https://www.youtube.com/watch?v=zJYuLebl-Js


Sobre Git:
	Para borrar una rama:
		git push -d <remote_name> <branch_name>
		git branch -d <branch_name>

Para mandar mails:
	Hay que ejecutar los siguientes comandos cuando se sube todo a 
	heroku, desde una terminal, parado en la carpeta del proyecto.

	heroku config:set email=tuemail@gmail.com
	heroku config:set email_password=tupassword

	Donde el mail y la contrasenia son las de la empresa desarrolladora.