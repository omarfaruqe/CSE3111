require 'rails_helper'

RSpec.describe Course, type: :model do
  it { should validate_presence_of(:CourseType) }
  it { should validate_presence_of(:CourseName) }
  it { should validate_presence_of(:CourseDuration) }
end
