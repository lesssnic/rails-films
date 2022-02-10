class Actor < ApplicationRecord
  has_many :film_actors, dependent: :destroy
  has_many :films, through: :film_actors
  validates :name, presence: true
end
