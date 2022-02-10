class Film < ApplicationRecord
  belongs_to :director
  has_many :film_actors, dependent: :destroy
  has_many :actors, through: :film_actors
  has_many :film_genres, dependent: :destroy
  has_many :genres, through: :film_genres
  has_many :reviews, dependent: :destroy
  has_many :film_producers, dependent: :destroy
  has_many :producers, through: :film_producers

  enum limit: {"0": "0+", "6": "6+", "12": "12+", "16": "16+", "18": "18+"}

  validates :limit, presence: true, inclusion: {in: %w[0 6 12 16 18], message: "%{value} is not valid"}
  validates :name, presence: true, length: {maximum: 255, too_long: "%{count} characters is the maximum allowed"}
  validates :budget, numericality: {only_integer: true}, allow_nil: true
  validates :gather, numericality: {only_integer: true}, allow_nil: true
  validates :description, presence: true, length: {minimum: 10, too_short: "%{count} characters is the minimum allowed"}
  validates :poster, length: {maximum: 255, too_long: "%{count} characters is the maximum allowed"}
  validates :director_id, numericality: {only_integer: true}, allow_nil: true, presence: false
  validates :imdb, length: {maximum: 255, too_long: "%{count} characters is the maximum allowed"}

  def rating
    (reviews.sum(&:rating).to_f / reviews.size) if reviews.size > 0
  end

  def self.to_csv
    attributes = %w[id name description poster limit]
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |film|
        csv << attributes.map { |attr| film.send(attr) }
      end
    end
  end
end
