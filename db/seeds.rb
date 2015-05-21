# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

emails = %w(
  abhishek@joshsoftware.com
  aditya@joshsoftware.com
  deepak@joshsoftware.com
  gautam@joshsoftware.com
  jiren@joshsoftware.com
  pankaj@joshsoftware.com
  pramod@joshsoftware.com
  shailesh@joshsoftware.com
  anil@joshsoftware.com
  ashish@joshsoftware.com
  kiran@joshsoftware.com
  pratik@joshsoftware.com
  sethu@joshsoftware.com
  rishi@joshsoftware.com
)

emails.each do |email|
  name = email.split('@').first
  User.create(email: email, password: "#{name}123", name: name)
end
