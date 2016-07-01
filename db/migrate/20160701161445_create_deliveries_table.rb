class CreateDeliveriesTable < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.belongs_to :vehicle
      t.integer :scheduled_delivery_id
      t.datetime :delivery_date
      t.datetime :deleted_at
      t.datetime :created_at
      t.datetime :updated_at
      t.string :notes

      t.index :vehicle_id
      t.index :scheduled_delivery_id
      t.index :delivery_date
      t.index :deleted_at
    end
    create_join_table :deliveries, :users do |t|
      t.index :delivery_id, name: 'delivery_on_delivery_id'
      t.index :user_id, name: 'delivery_on_user_id'
    end
  end
end
