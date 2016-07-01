class Sale < ActiveRecord::Base
  belongs_to :user
  belongs_to :customer

  has_many :items
  has_many :scheduled_deliveries, dependent: :destroy
  has_many :address_sales, dependent: :destroy
  has_many :addresses, through: :address_sales

  after_create :reload

  validates_presence_of :user_id, :customer_id, :sale_date
end
