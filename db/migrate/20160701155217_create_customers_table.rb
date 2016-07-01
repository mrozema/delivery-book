class CreateCustomersTable < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string   :email, default: "", null: false
      t.string   :first_name
      t.string   :last_name
      t.string   :phone_number
      t.boolean  :email_opt_in, default: true
      t.datetime :deleted_at
      t.datetime :created_at
      t.datetime :updated_at
      t.string :notes

      t.index :email
      t.index :last_name
      t.index :phone_number
      t.index :deleted_at
    end
  end
end
