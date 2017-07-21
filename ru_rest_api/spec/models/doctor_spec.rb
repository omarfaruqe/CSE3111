require 'rails_helper'

RSpec.describe Doctor, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:fee) }
  it { should validate_presence_of(:visit_time) }
end
