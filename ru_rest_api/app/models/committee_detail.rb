class CommitteeDetail < ApplicationRecord
validates_presence_of :name, :president, :secretary
end
