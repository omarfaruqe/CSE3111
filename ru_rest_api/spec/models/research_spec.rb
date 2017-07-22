require 'rails_helper'

RSpec.describe Research, type: :model do

  # pending "add some examples to (or delete) #{__FILE__}"

  it "is valid with valid attributes" do
     expect(Research.new).to be_valid
  end

  it "is not valid without a name" do
     research = Research.new(name:nil)
     expect(research).to_not be_valid
  end

  it "is not valid wihtout a topic" do
      research = Research.new(topic:nil)
      expect(research).to_not be_valid
  end


end
