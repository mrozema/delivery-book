class CreateItemsTable < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :sale
      t.belongs_to :delivery
      t.belongs_to :scheduled_delivery
      t.datetime :deleted_at
      t.datetime :created_at
      t.datetime :updated_at
      t.string :model
      t.string :serial
      t.string :brand
      t.boolean :sold, default: false

      t.index :model
      t.index :serial
      t.index :brand
      t.index :sold
      t.index :deleted_at
    end
  end
end
