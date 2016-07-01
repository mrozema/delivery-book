class DeliveryCrew < ActiveRecord::Base
  self.table_name = "deliveries_users"
  belongs_to :delivery
  belongs_to :user

  validates_uniqueness_of :delivery_id, scope: :user_id
  validates_uniqueness_of :user_id, scope: :delivery_id

  def ==(other)
    delivery_id == other.delivery_id &&
      user_id == other.user_id
  end
end
