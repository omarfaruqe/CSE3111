class Guest < ApplicationRecord
	validates_presence_of :name, :status, :arrival
end
