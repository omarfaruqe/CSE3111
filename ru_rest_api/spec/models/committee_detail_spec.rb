require 'rails_helper'

RSpec.describe CommitteeDetail, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:president) }
  it { should validate_presence_of(:secretary) }
end
