class Director < ApplicationRecord
  has_many :films
  validates :first_name, uniqueness: {scope: :last_name}, presence: true
  validates :last_name, presence: true
end
