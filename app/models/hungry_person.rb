class HungryPerson < ActiveRecord::Base
  validates :telephone_number, presence: true,
                                 format: { with: /\A\+44\d+\z/,
                                        message: "must start with +44" }
end
