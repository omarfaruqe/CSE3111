require 'rails_helper'

RSpec.describe Residence, type: :model do
  it { should validate_presence_of(:Dormitory_name) }
  it { should validate_presence_of(:Total_seat) }
  it { should validate_presence_of(:Notice) }
end
