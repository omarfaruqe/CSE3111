require 'rails_helper'

RSpec.describe Residence, type: :model do
 before :each do
	@item =  Residence.new
  end


  it "is valid with valid attributes" do
  @item.Dormitory_name = "anything" 
  @item.Total_seat = "anything" 
  @item.Notice = "anything" 
 # @item.year = "anything" 
  expect(@item).to be_valid
  end

  it "is invalid without a Dormitory_name" do
  	@item.Dormitory_name = nil
  	expect(@item).to_not be_valid
  end	

it "is invalid without a Total_seat" do
  	@item.Total_seat = nil
  	expect(@item).to_not be_valid
  end	

  it "is invalid without a Notice" do
  	@item.Notice = nil
  	expect(@item).to_not be_valid
  end	

  #it "is invalid without a year" do
  #	@item.year = nil
  	#expect(@item).to_not be_valid
 # end	

end
