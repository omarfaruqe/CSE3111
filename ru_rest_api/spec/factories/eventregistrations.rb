FactoryGirl.define do
  factory :eventregistration do
     name { Faker::Lorem.word }
    roll { Faker::Lorem.word }
    department { Faker::Lorem.word}
  end
end
