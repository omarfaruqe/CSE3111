require 'rails_helper'

RSpec.describe TeachersQuarter, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:block) }
  it { should validate_presence_of(:location) }
end
