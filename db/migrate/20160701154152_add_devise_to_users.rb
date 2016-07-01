class AddDeviseToUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :deleted_at
      t.string   :authentication_token
      t.string   :first_name
      t.string   :last_name
      t.string   :phone
      t.string   :title
      t.boolean  :super_user, default: false

      t.index :deleted_at
      t.index :email
      t.index :reset_password_token
    end
  end
end
