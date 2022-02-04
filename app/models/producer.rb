class Producer < ApplicationRecord
  has_many :film_producers, dependent: :destroy
  has_many :films, through: :film_producers
  validates :name, presence: true, uniqueness: true
end
