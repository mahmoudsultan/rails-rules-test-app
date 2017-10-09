# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do
  Agency.create({name: Faker::Bank.name, agency_type: rand(10).to_i, no_of_sales: rand(1000)})
end
# Agency.create({name: Faker::Bank.name, agency_type: 4, no_of_sales: 300})