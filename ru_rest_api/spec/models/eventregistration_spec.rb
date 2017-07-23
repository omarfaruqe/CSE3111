require 'rails_helper'

RSpec.describe Eventregistration, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:roll) }
  it { should validate_presence_of(:department) }
end
