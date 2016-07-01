class Item < ActiveRecord::Base
  belongs_to :sale
  belongs_to :scheduled_delivery
  belongs_to :delivery

  after_create :reload

  validates_presence_of :model, :serial, :brand

  scope :sold, -> { where(sold: true) }
  scope :unsold, -> { where(sold: false) }

  def address
    scheduled_delivery.address
  end

  def is_scheduled
    self.scheduled_delivery_id.present? && self.delivery_id.nil?
  end

  def is_delivered
    self.delivery_id.nil?
  end

  def is_sold?
    self.sold
  end
end
