FactoryGirl.define do
  factory :residence do
   # Dormitory_name "MyString"
   # Total_seat 1
    #Notice "MyString"
     Dormitory_name { Faker::Lorem.word }
   Total_seat { Faker::Number.number(4) }
    Notice { Faker::Lorem.word }
  end
end
