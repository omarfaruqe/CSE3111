FactoryGirl.define do
  factory :schedule do
    bus_id { Faker::Lorem.word }
    departure_time { Faker::Lorem.word }
    destination { Faker::Lorem.word }
  end
end
