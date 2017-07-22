class Research < ApplicationRecord
  validates_presence_of :name, :topic
end
