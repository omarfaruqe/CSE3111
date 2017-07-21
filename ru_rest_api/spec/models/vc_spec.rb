require 'rails_helper'

RSpec.describe Vc, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:department) }
  it { should validate_presence_of(:year) }
end
