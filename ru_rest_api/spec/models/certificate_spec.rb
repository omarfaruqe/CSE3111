require 'rails_helper'

RSpec.describe Certificate, type: :model do
	before :each do
		@certificate = Certificate.new
	end


	it "is valid with valid arrtributes" do
	  @certificate.name = "something"
	  @certificate.shift = "something"
	  @certificate.duration = "something"
	  @certificate.requirement = "something"
	  expect(@certificate).to be_valid
	end

	it "is invalid without a name" do
	  	@certificate.name = nil
	  	expect(@certificate).to_not be_valid
	end

	it "is invalid without a shift" do
	  	@certificate.shift = nil
	  	expect(@certificate).to_not be_valid
	end

	it "is invalid without a duration" do
	  	@certificate.duration = nil
	  	expect(@certificate).to_not be_valid
	end

	it "is invalid without a requirement" do
	  	@certificate.requirement = nil
	  	expect(@certificate).to_not be_valid
	end
end
