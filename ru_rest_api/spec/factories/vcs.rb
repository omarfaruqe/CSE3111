FactoryGirl.define do
  factory :vc do
    name { Faker::Lorem.word }
    department { Faker::Lorem.word }
    year { Faker::Number.number(4) }
  end
end
