class TeamMembership < ActiveRecord::Base
  self.table_name = "teams_users"
  belongs_to :team
  belongs_to :user

  scope :admin, ->{where(admin: true)}

  validates_uniqueness_of :team_id, scope: :user_id
  validates_uniqueness_of :user_id, scope: :team_id

  def ==(other)
    team_id == other.team_id &&
      user_id == other.user_id
  end
end
