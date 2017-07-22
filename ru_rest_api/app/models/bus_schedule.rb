class BusSchedule < ApplicationRecord
	validates_presence_of :bus_id, :time, :starting_place, :destination, :bus_type
end
