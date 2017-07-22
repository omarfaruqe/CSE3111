class User < ApplicationRecord
	validates_presence_of :Name, :User_Id, :Address, :Phone
end
