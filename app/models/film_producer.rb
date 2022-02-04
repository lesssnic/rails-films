class FilmProducer < ApplicationRecord
  belongs_to :producer
  belongs_to :film
  validates :film_id, numericality: {only_integer: true}
  validates :producer_id, numericality: {only_integer: true}
end
