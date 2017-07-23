FactoryGirl.define do
  factory :guest do
    name { Faker::Lorem.word }
    status { Faker::Lorem.word }
    arrival { Faker::Lorem.word }
  end
end
