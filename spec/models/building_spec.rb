require 'spec_helper'

describe Building do
	it { should have_valid(:street_address).when('5 Apple Street', '5 Apple St.') }
	it { should_not have_valid(:street_address).when(nil, '') }

	it { should have_valid(:city).when('Boston') }
	it { should_not have_valid(:city).when(nil, '') }

	it { should have_valid(:state).when('Massachusetts') }
	it { should_not have_valid(:state).when(nil, '') }

	it { should have_valid(:postal_code).when(02215) }
	it { should_not have_valid(:postal_code).when(nil, '') }

	it { should have_one(:owner) }
end
