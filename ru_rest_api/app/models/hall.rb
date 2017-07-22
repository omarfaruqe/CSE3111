class Hall < ApplicationRecord
	validates_presence_of :Hall_Id, :Hall_Name, :Provost_Name, :Capacity
end
