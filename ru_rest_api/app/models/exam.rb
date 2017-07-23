class Exam < ApplicationRecord
	#validates_presence_of :exam_id
	#validates_presence_of :time
	#validates_presence_of :date
	#validates_presence_of :length

	validates_presence_of :exam_id, :time, :date, :length
end
