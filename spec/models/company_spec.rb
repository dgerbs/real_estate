require 'spec_helper'

describe Company do
 	it { should have_many :owners }

 	it { should have_valid(:name).when('Boston Real Estate', 'BRE') }
 	it { should_not have_valid(:name).when(nil, '') }
end
