class Delivery < ActiveRecord::Base
  belongs_to :vehicle
  belongs_to :scheduled_delivery
  has_many :delivery_crews, dependent: :destroy

  has_many :users, through: :delivery_crews
  has_many :items

  after_create :reload

  validates_presence_of :delivery_date
end
