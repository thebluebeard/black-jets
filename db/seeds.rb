# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Flight.delete_all
# Jet.delete_all
# User.delete_all

JET_MODELS = ["Cessna 210","Focker 23","Concord 4","Bombarbier 210","Rafale","Turboprop 1","X-Wings 12","Dufourspitze 1","Kangchenjunga","Cerro Arripo"]
MEAL = ["Vegetarian","Japanese","Indian","French","Italian"]

AIRPORTS = ["Paris","New York","Madrid","Oslo","New York","Chicago","Los Angeles","Bern","Shanghai","Beijing","Bangkok","Hanoi","Vientiane","Kuala Lumpur","Johannesburg","Buenos Aires"]

# these are for the search result test
User.create(
  email: "lantheman@theman.com",
  password:"123456",
  phone: '88888888',
  jet_owner: true,
  username: 'lantheman'
)

Jet.create(
  user_id: 1,
  plane_model: JET_MODELS.sample,
  seat_number: rand(7..20),
  production_year: rand(1990..2017),
  wifi: rand > 0.5,
  meal: MEAL.sample,
  description: "A plane with wings"
)

3.times do
  Flight.create(user_id: 1,
    jet_id: 1,
    origin: "Shanghai",
    destination: "Beijing",
    departure: "2017/12/01 14:00:00".to_datetime,
    arrival: "2017/12/01 16:00:00".to_datetime,
    price: rand(4_000...30_000),
    capacity: 10,
    status: "On time"
  )
end
# above is only for test


def generate_jets(jet_owner)
  rand(1..4).times do
    Jet.create(user_id: jet_owner.id,
      plane_model: JET_MODELS.sample,
      seat_number: rand(7..20),
      production_year: rand(1990..2017),
      wifi: rand > 0.5,
      meal: MEAL.sample,
      description: "A plane with wings"
    )
  end
end

10.times do |x|
  a = User.create(username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password:"123456",
    phone: Faker::PhoneNumber.cell_phone,
    jet_owner: x < 4 ? true : false
  )
  generate_jets(a) if a.jet_owner
end
puts "Users seeded"
puts "Jets seeded"


Jet.all.each do |jet|
  10.times do
    a = Faker::Date.forward(rand(3..15))
    time = "#{rand(6..13)}:#{rand(0..59)}".to_time

    Flight.create(user_id: jet.user.id,
      jet_id: jet.id,
      origin: AIRPORTS.sample,
      destination: AIRPORTS.sample,
      departure: Faker::Time.forward(23, :morning),
      arrival: Faker::Time.forward(23, :afternoon),
      price: rand(4_000...30_000),
      capacity: 10,
      status: "On time"
    )
  end
end

puts 'Flights seeded'

Flight.all.each do |flight|
  3.times do
    Booking.create(user_id: User.all.sample.id,
      flight_id: flight.id
    )
  end
  5.times do
    Review.create(user_id: User.all.sample.id,
      flight_id: flight.id,
      ambiance_rating: rand(4..5),
      service_rating: rand(4..5),
      description: "This is a really good flight and I enjoyed it a lot. Blackjet is an awesome service and I'll definitely use it again"
    )
  end
end
puts 'reviews and bookins seeded'
