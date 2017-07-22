require 'rails_helper'

RSpec.describe BusSchedule, type: :model do
  it { should validate_presence_of(:bus_id) }
  it { should validate_presence_of(:time) }
  it { should validate_presence_of(:starting_place) }
  it { should validate_presence_of(:destination) }
  it { should validate_presence_of(:bus_type) }
end
