require 'spec_helper'

feature 'add an owner', %Q{
	As a real estate associate
	I want to record a building owner
	So that I can keep track of our relationships with owners
	} do 

	# Acceptance Criteria:

	# I must specify a first name, last name, and email address
	# I can optionally specify a company name
	# If I do not specify the required information, I am presented with errors
	# If I specify the required information, the owner is recorded and I am redirected to enter another new owner
	
		scenario 'specify owner information' do
			company_name = "Boston Real Estate"
			FactoryGirl.create(:company, name: company_name)
			prev_count = Owner.count

			visit new_owner_url
			fill_in 'first name', with: "John"
			fill_in 'last name', with: "Smith"
			fill_in 'email address', with: "user@example.com"
			select company_name, from: "Company"

			click_button 'Submit'
			expect(page).to have_content('Owner created')
			expect(Owner.count).to eql(prev_count + 1)
			expect(Owner.last.company).to_not be_nil
		end
		scenario 'specify invalid owner' do
			prev_count = Owner.count

			visit new_owner_path

			click_button 'Submit'
			expect(page).to have_content("can't be blank")
			expect(page).to eql(prev_count)
		end
	end