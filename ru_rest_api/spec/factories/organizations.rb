FactoryGirl.define do
  factory :organization do
    name { Faker::Lorem.word }
    organization_type { Faker::Lorem.word }
    total_member { Faker::Lorem.word }
    objective_and_policy { Faker::Lorem.word }
  end
end
