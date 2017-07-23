FactoryGirl.define do
  factory :exam do
    exam_id { Faker::Lorem.word }
    time { Faker::Lorem.word }
    date { Faker::Lorem.word }
    length { Faker::Lorem.word }
  end
end
