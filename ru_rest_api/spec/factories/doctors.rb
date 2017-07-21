FactoryGirl.define do
  factory :doctor do
    name { Faker::Lorem.word }
    fee { Faker::Lorem.word }
    visit_time { Faker::Lorem.word }
  end
end
