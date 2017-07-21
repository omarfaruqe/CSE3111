class TeachersQuarter < ApplicationRecord
	validates_presence_of :name, :block, :location
end
