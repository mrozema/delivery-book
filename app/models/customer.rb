class Customer < ActiveRecord::Base
  has_many :addresses
  has_many :sales
  has_many :items, through: :sales

  after_create :reload

  validates_presence_of :first_name, :last_name, :phone_number

  def friendly_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end
end
