require 'rails_helper'

RSpec.describe Hall, type: :model do
  it { should validate_presence_of(:Hall_Id) }
  it { should validate_presence_of(:Hall_Name) }
  it { should validate_presence_of(:Provost_Name) }
  it { should validate_presence_of(:Capacity) }
end
