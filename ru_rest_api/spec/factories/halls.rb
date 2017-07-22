FactoryGirl.define do
  factory :hall do
    Hall_Id { Faker::Number.number(5) }
    Hall_Name { Faker::Lorem.word }
    Provost_Name { Faker::Lorem.word }
    Capacity { Faker::Number.number(5) }
  end
end
