require 'spec_helper'

feature 'add a building', %Q{
	As a real estate associate
	I want to record a building
	So that I can refer back to pertinent information
} do

# Acceptance Criteria:

# I must specify a street address, city, state, and postal code
# Only US states can be specified
# I can optionally specify a description of the building
# I can optionally match an owner with a building
# If I enter all of the required information in the required format, the building is recorded.
# If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
# Upon successfully creating a building, I am redirected so that I can record another building.

	scenario 'records a valid building entry' do
		owner = FactoryGirl.create(:owner)
		prev_count = Building.count

		visit new_building_url
		fill_in 'Street Address', with: '5 Apple Street'
		fill_in 'City', with: 'Boston'
		fill_in 'State', with: 'Massachusetts'
		fill_in 'Postal code', with: '02215'
		select owner, from: 'Owner'

		click_button 'Submit'
		expect(page).to have_content("New building entered")
		expect(Building.count).to eql(prev_count + 1)
	end
	scenario 'does not record an invalid entry' do
		prev_count = Building.count

		visit new_building_url

		click_button 'Submit'
		expect(page).to have_content("can't be blank")
		expect(Building.count).to eql(prev_count)
	end
end