class Schedule < ApplicationRecord
	validates_presence_of :bus_id, :departure_time, :destination
end
