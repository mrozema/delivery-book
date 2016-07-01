class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  before_save :ensure_authentication_token

  has_many :team_memberships, dependent: :destroy
  has_many :delivery_crews, dependent: :destroy
  has_many :sales

  has_many :teams, through: :team_memberships
  has_many :deliveries, through: :delivery_crews

  after_create :reload

  validates_presence_of :first_name, :last_name

  accepts_nested_attributes_for :team_memberships, allow_destroy: true

  def friendly_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def super_user?
    self.super_user
  end

  private
    def ensure_authentication_token
      if authentication_token.blank?
        self.authentication_token = generate_authentication_token
      end
    end

    def generate_authentication_token
      loop do
        token = Devise.friendly_token
        break token unless User.where(authentication_token: token).first
      end
    end
end
