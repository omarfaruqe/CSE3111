FactoryGirl.define do
  factory :student do
    Student_id { Faker::Lorem.word }
    Name { Faker::Lorem.word }
    Department { Faker::Lorem.word }
    Session { Faker::Lorem.word }
    eligible_status { Faker::Lorem.word }
  end
end
