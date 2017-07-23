class Certificate < ApplicationRecord
	
	validates_presence_of :name
	validates_presence_of :shift
	validates_presence_of :duration
	validates_presence_of :requirement

end
