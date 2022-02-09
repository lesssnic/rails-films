class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  include Authorship
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reviews, dependent: :destroy

  enum role: %i[basic admin], _suffix: :role

  def author?(obj)
    obj.user == self
  end

  def active_for_authentication?
    super && blocked_at.nil?
  end
end
