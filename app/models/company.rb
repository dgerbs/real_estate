class Company < ActiveRecord::Base
	has_many :owners,
		inverse_of: :company,
		dependent: :nullify

	validates_presence_of :name
end
