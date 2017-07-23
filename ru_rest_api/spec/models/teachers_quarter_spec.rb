require 'rails_helper'

RSpec.describe TeachersQuarter, type: :model do
  # it { should validate_presence_of(:name) }
  # it { should validate_presence_of(:block) }
  # it { should validate_presence_of(:location) }
  # 
  
  before :each do
  	@teachers_quarter = TeachersQuarter.new
  end

  it 'should validate with valid attributes' do
  	@teachers_quarter.name = 'foobar'
  	@teachers_quarter.block = 'foobar'
  	@teachers_quarter.location = 'foobar'
  	expect(@teachers_quarter).to be_valid
  end

  it 'should not be valid without name' do
  	@teachers_quarter.name = nil
  	expect(@teachers_quarter).to_not be_valid
  end

  it 'should not be valid without block' do
  	@teachers_quarter.block = nil
  	expect(@teachers_quarter).to_not be_valid
  end

  it 'should not be valid without location' do
  	@teachers_quarter.location = nil
  	expect(@teachers_quarter).to_not be_valid
  end


end
