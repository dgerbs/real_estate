class OwnersController < ApplicationController
	def new
		@owner = Owner.new
	end

	def create
		@owner = Owner.new(owner_params)

		if @owner.save
			redirect_to new_owner_path, notice: "Owner created"
		else
			render :new
		end
	end

	def owner_params
		params.require(:owner).permit(:first_name, :last_name, :email_address, :company_id, :building_id)
	end
end
