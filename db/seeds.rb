# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# 10.times do
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name
#   Director.create first_name: first_name, last_name: last_name
# end

# 6.times do
#   name = Faker::Movies::Hobbit.character
#   Actor.create name: name
# end
10.times do
  name = Faker::Movies::HarryPotter.character
  Actor.create name: name
end
# 100.times do
#   lim = ["0", "6", "12", "16", "18"]
#   name = Faker::Movie.title
#   description = Faker::Lorem.paragraph
#   poster = Faker::Avatar.image
#   director_id = Faker::Number.between(from: 1, to: 30)
#   limit = lim.sample
#   Film.create name: name, description: description, poster: poster, director_id: director_id, limit: limit
# end
