class Level < ApplicationRecord
	has_many :users
	has_and_belongs_to_many :actions

	#Validaciones
	validates :points,
		presence: true
	validates :points,
		numericality: true
	validates :points,
		uniqueness: true

	validates :name,
		presence: true
	validates :name,
		uniqueness: true

	scope :puntos,-> {order("points")}
 	scope :actualizar,-> {order("points desc")}
 	scope :min,-> {order("points").first}



 	def delete
 		if (self.users.count == 0)
 			self.destroy
 			return true
 		else
 			if self.id == Level.puntos.first.id
 				return false
 			else
 				previous = Level.actualizar.where("points < #{self.points}").first
 				self.users.each do |u|  
 					u.level_id = previous.id
 					u.save
 				end
 				self.users.clear
 				self.delete
 			end
 		end
 	end
end
