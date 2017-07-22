FactoryGirl.define do
  factory :bus_schedule do
    bus_id { Faker::Number.number(5) }
    time { Faker::Lorem.word }
    starting_place { Faker::Lorem.word }
    destination { Faker::Lorem.word }
    bus_type { Faker::Lorem.word }
  end
end
