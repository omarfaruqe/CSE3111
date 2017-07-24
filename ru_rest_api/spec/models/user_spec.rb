require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
	@item =  User.new
  end
   it "is valid with valid attributes" do
  @item.email = "anything" 
  @item.password = "anything" 
end
   it "is invalid without a email" do
  	@item.email = nil
  	expect(@item).to_not be_valid
  end
  it "is invalid without a password" do
  	@item.password = nil
  	expect(@item).to_not be_valid
  end

end
