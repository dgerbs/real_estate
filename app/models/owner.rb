class Owner < ActiveRecord::Base
	validates_presence_of :first_name
	validates_presence_of :last_name
	validates_presence_of :email_address

	belongs_to :company
	belongs_to :building

	def name
		first_name + ' ' + last_name
	end
end
