class AddAdminField < ActiveRecord::Migration
  def change
    add_column :teams_users, :admin, :boolean, default: false
  end
end
