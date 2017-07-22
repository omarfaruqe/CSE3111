FactoryGirl.define do
  factory :course do
    CourseType { Faker::Lorem.word }
    CourseName { Faker::Lorem.word }
    CourseDuration { Faker::Lorem.word }
  end
end
