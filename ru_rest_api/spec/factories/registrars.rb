FactoryGirl.define do
  factory :registrar do
    name { Faker::Lorem.word }
    about { Faker::Lorem.word }
    contact { Faker::Lorem.word }
  end
end
