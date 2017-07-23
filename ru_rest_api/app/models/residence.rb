class Residence < ApplicationRecord
	validates_presence_of :Dormitory_name, :Total_seat, :Notice
end
