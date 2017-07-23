class Eventregistration < ApplicationRecord
	 validates_presence_of :name, :roll ,:department
end
