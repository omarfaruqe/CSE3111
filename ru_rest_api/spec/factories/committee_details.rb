FactoryGirl.define do
  factory :committee_detail do
    name { Faker::Lorem.word }
    president { Faker::Lorem.word }
    secretary { Faker::Lorem.word }
  end
end
