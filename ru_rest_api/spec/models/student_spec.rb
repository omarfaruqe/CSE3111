require 'rails_helper'

RSpec.describe Student, type: :model do
  it { should validate_presence_of(:Student_id) }
  it { should validate_presence_of(:Name) }
  it { should validate_presence_of(:Department) }
  it { should validate_presence_of(:Session) }
  it { should validate_presence_of(:eligible_status) }
end
