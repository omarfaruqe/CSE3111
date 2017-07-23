class Organization < ApplicationRecord

	validates_presence_of :name, :organization_type, :total_member, :objective_and_policy
end
