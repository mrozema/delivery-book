class CreateAddressesTable < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.belongs_to :customer
      t.boolean    :is_primary
      t.string     :phone_number
      t.string     :street_address
      t.string     :street_address2
      t.string     :city
      t.string     :state
      t.string     :zip
      t.string     :country, default: "USA"
      t.datetime :deleted_at
      t.datetime :created_at
      t.datetime :updated_at
      t.string :notes

      t.index :customer_id
      t.index :phone_number
      t.index :deleted_at
    end
  end
end
