require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:Name) }
  it { should validate_presence_of(:User_Id) }
  it { should validate_presence_of(:Address) }
   it { should validate_presence_of(:Phone) }
end
