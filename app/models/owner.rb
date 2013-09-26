class Owner < ActiveRecord::Base
	validates_presence_of :first_name
	validates_presence_of :last_name
	validates_presence_of :email_address

	belongs_to :company,
		inverse_of: :owners
end
