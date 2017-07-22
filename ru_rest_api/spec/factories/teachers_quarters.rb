FactoryGirl.define do
  factory :teachers_quarter do
    
    name { Faker::Lorem.word }
    block { Faker::Lorem.word }
    location { Faker::Lorem.word }

  end
end
