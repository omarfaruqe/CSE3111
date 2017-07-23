require 'rails_helper'

RSpec.describe Ambulance, type: :model do

	before :each do
		@ambulance = Ambulance.new
	end
  	# ensure columns title and created_by are present before saving
  	it { should validate_presence_of(:route) }
  	it { should validate_presence_of(:availability) }
  	it { should validate_presence_of(:contact_number) }
  	
  	it "is valid with valid attributes" do
		@ambulance.route = "Rajshahi-Dhaka"
		@ambulance.availability  = "available"
		@ambulance.contact_number      = "01700000000"
		expect(@ambulance).to be_valid
	end

	it "is not valid without a route" do
		@ambulance.route = nil
		expect(@ambulance).to_not be_valid
	end

	it "is not vaild without a availability" do
		@ambulance.availability = nil
		expect(@ambulance).to_not be_valid
	end

	it "is not vaild without a contact_number" do
		@ambulance.contact_number = nil
		expect(@ambulance).to_not be_valid
	end

end
