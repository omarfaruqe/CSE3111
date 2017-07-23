FactoryGirl.define do
  factory :member do
    name { Faker::Lorem.word }
    stdId { Faker::Lorem.word }
    contactInfo { Faker::Lorem.word }
    memberStatus { Faker::Lorem.word }
  end
end
