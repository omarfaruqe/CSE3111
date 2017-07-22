class Student < ApplicationRecord
	validates_presence_of :Student_id, :Name, :Department, :Session, :eligible_status
end
