require 'rails_helper'

RSpec.describe Member, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:stdId) }
  it { should validate_presence_of(:contactInfo) }
  it { should validate_presence_of(:memberStatus) }
end
