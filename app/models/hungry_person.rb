class HungryPerson < ActiveRecord::Base
  validates_presence_of :telephone_number
end
