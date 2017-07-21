class Vc < ApplicationRecord
	validates_presence_of :name, :department, :year
end
