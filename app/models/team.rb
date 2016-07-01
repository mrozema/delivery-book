class Team < ActiveRecord::Base
  has_many :team_memberships
  has_many :users, through: :team_memberships

  after_create :reload

  validates :name, presence: true


  default_scope { order(:name) }

  def display_name
    "#{name} (#{id})"
  end
end
