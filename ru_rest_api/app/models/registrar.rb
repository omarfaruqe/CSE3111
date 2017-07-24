class Registrar < ApplicationRecord
	  validates_presence_of :name, :about, :contact
end
