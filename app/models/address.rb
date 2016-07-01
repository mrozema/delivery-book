class Address < ActiveRecord::Base
  belongs_to :customer
  has_many :deliveries
  has_many :items, through: :sales

  has_many :address_sales, dependent: :destroy
  has_many :sales, through: :address_sales

  after_create :reload

  validates_presence_of :street_address, :zip
end
