# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Flight.delete_all
Jet.delete_all
User.delete_all

20.times do
  User.create(username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password:"123456",
    phone: Faker::PhoneNumber.cell_phone,
    jet_owner: rand > 0.7)
end
puts "Users seeded"


JET_MODELS = ["Cessna 210","Focker 23","Concord 4","Bombarbier 210","Rafale","Turboprop 1","X-Wings 12","Dufourspitze 1","Kangchenjunga","Cerro Arripo"]
MEAL = ["Vegetarian","Japanese","Indian","French","Italian"]
7.times do
  Jet.create(user_id: User.all.sample.id,
    plane_model: JET_MODELS.sample,
    seat_number: rand(7..20),
    production_year: rand(1990..2017),
    wifi: rand > 0.5,
    meal: MEAL.sample,
    description: "A plane with wings")
end
puts "Jets seeded"

AIRPORTS = ["Paris","New York","Madrid","Oslo","New York","Chicago","Los Angeles","Bern","Shanghai","Beijing","Bangkok","Hanoi","Vientiane","Kuala Lumpur","Johannesburg","Buenos Aires"]
20.times do
  a = Faker::Date.forward(rand(3..15))
  time = "#{rand(6..13)}:#{rand(0..59)}".to_time

  Flight.create(user_id: User.all.sample.id,
    jet_id: Jet.all.sample.id,
    origin: AIRPORTS.sample,
    destination: AIRPORTS.sample,
    departure: Faker::Time.forward(23, :morning),
    arrival: Faker::Time.forward(23, :afternoon),
    price: rand(4_000...30_000),
    status: "On time")
end
puts 'Flights seeded'
