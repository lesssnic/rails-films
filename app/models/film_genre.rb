class FilmGenre < ApplicationRecord
  belongs_to :genre
  belongs_to :film
  validates :film_id, numericality: {only_integer: true}
  validates :genre_id, numericality: {only_integer: true}
end
