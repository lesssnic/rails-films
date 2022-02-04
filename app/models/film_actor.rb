class FilmActor < ApplicationRecord
  belongs_to :actor
  belongs_to :film
  validates :film_id, numericality: {only_integer: true}
  validates :actor_id, numericality: {only_integer: true}
end
