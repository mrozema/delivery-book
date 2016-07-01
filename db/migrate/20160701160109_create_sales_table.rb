class CreateSalesTable < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.belongs_to :user
      t.belongs_to :customer
      t.datetime :sale_date
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :deleted_at
      t.string :notes
      
      t.index :user_id
      t.index :customer_id
      t.index :sale_date
      t.index :deleted_at
    end
    create_join_table :addresses, :sales do |t|
      t.index :sale_id, name: 'address_on_sale_id'
      t.index :address_id, name: 'address_on_addr_id'
    end
  end
end
