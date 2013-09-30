require 'spec_helper'

describe Owner do
	it { should have_valid(:first_name).when('John') }
	it { should_not have_valid(:first_name).when(nil, '') }

	it { should have_valid(:last_name).when('Smith') }
	it { should_not have_valid(:last_name).when(nil, '') }

	it { should have_valid(:email_address).when('user@example.com') }
	it { should_not have_valid(:email_address).when(nil, '') }

	it { should have_many(:buildings) }
	it { should belong_to(:company) }
end
