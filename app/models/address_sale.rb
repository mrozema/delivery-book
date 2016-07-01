class AddressSale < ActiveRecord::Base
  self.table_name = "addresses_sales"
  belongs_to :address
  belongs_to :sale

  validates_uniqueness_of :address_id, scope: :sale_id
  validates_uniqueness_of :sale_id, scope: :address_id

  def ==(other)
    sale_id == other.sale_id &&
      address_id == other.address_id
  end
end
