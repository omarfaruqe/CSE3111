require 'rails_helper'

RSpec.describe Research, type: :model do

  # pending "add some examples to (or delete) #{__FILE__}"

  it "is valid only with valid attributes" do
     expect(Research.new).to_not be_valid
  end

  it "is not valid without a name" do
     research = Research.new(name:nil)
     expect(research).to_not be_valid
  end

  it "is not valid wihtout a topic" do
      research = Research.new(topic:nil)
      expect(research).to_not be_valid
  end

  it "should be valid" do
    research = Research.new
    research.name = "forhad"
    research.topic = "atom"
    expect(research).to be_valid
  end

  it "should not be invalid" do
    research = Research.new
    research.name = nil
    research.topic = nil
    expect(research).to_not be_valid
  end

end
