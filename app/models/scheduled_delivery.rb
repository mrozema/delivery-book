class ScheduledDelivery < ActiveRecord::Base
  belongs_to :address
  belongs_to :sale
  has_many :items
  
  has_many :deliveries
  after_create :reload

  def is_complete?
    deliveries.present? && (items - deleveries.map(&:items)).empty?
  end

  validates_presence_of :scheduled_delivery_date
end
