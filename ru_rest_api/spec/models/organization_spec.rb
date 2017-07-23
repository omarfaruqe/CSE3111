require 'rails_helper'

RSpec.describe Organization, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:organization_type) }
  it { should validate_presence_of(:total_member) }
  it { should validate_presence_of(:objective_and_policy) }
end
