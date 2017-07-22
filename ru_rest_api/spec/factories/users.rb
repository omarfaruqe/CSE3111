FactoryGirl.define do
  factory :user do
   Name { Faker::Lorem.word }
    User_Id { Faker::Lorem.word }
    Address { Faker::Lorem.word }
    Phone { Faker::Lorem.word }
  end
end
