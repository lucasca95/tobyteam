class University < ApplicationRecord
	has_many :users
	

	#Validaciones
	validates :name,
		presence: true
	validates :name, 
		format: { with: /\A([a-zA-Z]+(?: +[a-zA-Z])?)+\z/, message: ": sólo se permiten letras en el nombre" }

	validates :province,
		presence: true
	validates :province, 
		format: { with: /\A([a-zA-Z]+(?: +[a-zA-Z])?)+\z/, message: ": sólo se permiten letras en el nombre" }

	validates :url,
		presence: true
end
