class Member < ApplicationRecord
	validates_presence_of :name, :stdId, :contactInfo, :memberStatus
end
