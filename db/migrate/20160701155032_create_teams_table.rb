class CreateTeamsTable < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :deleted_at

      t.index :name
      t.index :deleted_at
    end
    create_join_table :teams, :users do |t|
      t.index :team_id, name: 'team_on_team_id'
      t.index :user_id, name: 'team_on_user_id'
    end
  end
end
