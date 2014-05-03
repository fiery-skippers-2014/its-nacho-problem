# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

britt = User.create(username: "Britt", email: "me@me.com", password: 123)
paolo = User.create(username: "Paolo", email: "you@you.com", password: 123)

100.times do 
  britt.ingredients << Ingredient.find(rand(1...3000))
end

100.times do 
  paolo.ingredients << Ingredient.find(rand(1...3000))
end
