class Review < ApplicationRecord
  belongs_to :film
  belongs_to :user
  validates :film_id, numericality: {only_integer: true}
  validates :user_id, numericality: {only_integer: true}
  validates :description, length: {minimum: 10, too_short: "%{count} characters is the minimum allowed"}
  validates :rating, numericality: {only_integer: true}, allow_nil: true
end
