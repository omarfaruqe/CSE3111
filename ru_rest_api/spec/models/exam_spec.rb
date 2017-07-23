require 'rails_helper'

RSpec.describe Exam, type: :model do
  
  it { should validate_presence_of(:exam_id) }
  it { should validate_presence_of(:time) }
  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:length) }
end