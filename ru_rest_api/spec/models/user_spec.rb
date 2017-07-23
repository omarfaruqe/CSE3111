require 'rails_helper'

RSpec.describe User, type: :model do
  # Association test
  # ensure User model has a 1:m relationship with the Todo model
  #it { should have_many(:teachers_quarter) }
  # Validation tests
  # ensure name, email and password_digest are present before save
  # it { should validate_presence_of(:name) }
  # it { should validate_presence_of(:email) }
  # it { should validate_presence_of(:password_digest) }
  # 
  
  before :each do
  	@user = User.new
  end

  it 'should validate with valid attributes' do
  	@user.name = 'noName'
  	@user.email = 'ex@mail.com'
  	@user.password = 'password'
  	expect(@user).to be_valid
  end

  it 'should not be valid without user name' do 
  	@user.name = nil
  	expect(@user).to_not be_valid
  end

  it 'should not be valid without email' do
  	@user.email = nil
  	expect(@user).to_not be_valid
  end

  it 'should not be valid without password' do
  	@user.password = nil
  	expect(@user).to_not be_valid
  end
end
