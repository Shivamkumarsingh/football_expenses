# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

User.create!(email: 'admin@football.com', password: 'admin123')

10.times do |i|
  User.create!(email: "user#{i}@football.com", password: 'user123', name: "User-#{i}")
end
