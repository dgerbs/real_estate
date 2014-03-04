class BuildingsController < ApplicationController
	def new
		@building = Building.new
	end

	def create
		@building = Building.new(build_params)

		if @building.save
			redirect_to new_building_path, notice: "New building entered"
		else
			render :new
		end
	end

	def build_params
		params.require(:building).permit(:street_address, :city, :state, :postal_code)
	end
end
