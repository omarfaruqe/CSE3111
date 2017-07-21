class Doctor < ApplicationRecord
	validates_presence_of :name, :fee, :visit_time
end
