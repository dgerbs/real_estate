class Building < ActiveRecord::Base
	validates_presence_of :street_address
	validates_presence_of :city
	validates_presence_of :state
	validates_presence_of :postal_code

	has_one :owner,
		inverse_of: :building,
		dependent: :nullify
end
