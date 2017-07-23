FactoryGirl.define do
  factory :certificate do
  	
    
    name { Faker::Lorem.word }
    shift { Faker::Lorem.word }
    duration { Faker::Lorem.word }
    requirement { Faker::Lorem.word }
  end
end
