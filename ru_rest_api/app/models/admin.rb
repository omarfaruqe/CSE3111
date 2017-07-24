class Admin < ApplicationRecord
	validates :token, presence: true
end
