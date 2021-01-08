# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
4.times do |i|
  j = i+1
  u = User.create(username: "user#{j}", email: "sample#{j}@example.com", password: "password", password_confirmation: "password", deposit: 200)
  g = Game.create(user_id: u.id, number: "#{j}789", limit: i+3, bet: j * 10)
end
