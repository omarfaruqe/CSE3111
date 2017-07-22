class Course < ApplicationRecord
	validates_presence_of :CourseType, :CourseName, :CourseDuration
end
