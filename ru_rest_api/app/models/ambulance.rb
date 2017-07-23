class Ambulance < ApplicationRecord
  # validations
  validates_presence_of :route, :availability, :contact_number
end
