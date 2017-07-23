require 'rails_helper'

RSpec.describe Schedule, type: :model do
  it { should validate_presence_of(:bus_id) }
  it { should validate_presence_of(:departure_time) }
  it { should validate_presence_of(:destination) }
end
