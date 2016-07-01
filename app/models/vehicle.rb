class Vehicle < ActiveRecord::Base
  has_many :deliveries
  after_create :reload

  validates_presence_of :make, :model, :year
end
