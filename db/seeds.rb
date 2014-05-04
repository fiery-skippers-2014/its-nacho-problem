# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

paolo = User.create(username: "Paolo", email: "you@you.com", password: 123)

id = Ingredient.first.id

10.times do |n|
  paolo.ingredients << Ingredient.find(id + n)
end
