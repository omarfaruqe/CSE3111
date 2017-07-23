FactoryGirl.define do
  factory :ambulance do
    route { Faker::Lorem.word }
    availability{ Faker::Lorem.word }
    contact_number { Faker::Lorem.word }
  end
end

# FactoryGirl.define do
#   factory :ambulance do
#     route "MyString"
#     availability "MyString"
#     contact_number "MyString"
#   end
# end
