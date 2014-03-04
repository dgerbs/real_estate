class Owner < ActiveRecord::Base
	validates_presence_of :first_name
	validates_presence_of :last_name
	validates_presence_of :email_address

	has_many :buildings,
    inverse_of: :owner,
    dependent: :nullify
  belongs_to :company
	
	def name
		first_name + ' ' + last_name
	end
end
