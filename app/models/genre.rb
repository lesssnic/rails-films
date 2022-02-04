class Genre < ApplicationRecord
  has_many :film_genres, dependent: :destroy
  has_many :films, through: :film_genres
  validates :name, presence: true, uniqueness: true
end
