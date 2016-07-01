class CreateVehiclesTable < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.datetime :deleted_at
      t.datetime :created_at
      t.datetime :updated_at
      t.string :make
      t.string :model
      t.string :year
      t.index :deleted_at
    end
  end
end
