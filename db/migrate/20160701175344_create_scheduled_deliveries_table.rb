class CreateScheduledDeliveriesTable < ActiveRecord::Migration
  def change
    create_table :scheduled_deliveries do |t|
      t.belongs_to :address
      t.belongs_to :sale
      t.datetime :scheduled_delivery_date
      t.datetime :deleted_at
      t.datetime :created_at
      t.datetime :updated_at
      t.string :notes

      t.index :scheduled_delivery_date
      t.index :sale_id
      t.index :deleted_at
    end
  end
end
