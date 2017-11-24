# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Review.delete_all
Booking.delete_all
Flight.delete_all
Jet.delete_all
User.delete_all


JET_MODELS = ["Cessna 210","Focker 23","Concord 4","Bombarbier 210","Rafale","Turboprop 1","X-Wings 12","Dufourspitze 1","Kangchenjunga","Cerro Arripo"]
MEAL = ["Vegetarian","Japanese","Indian","French","Italian"]

AIRPORTS = ["Paris","New York","Madrid","Oslo","New York","Chicago","Los Angeles","Bern","Shanghai","Beijing","Bangkok","Hanoi","Vientiane","Kuala Lumpur","Johannesburg","Buenos Aires"]

IMAGES = [
  "https://media.cntraveler.com/photos/591dc120ef06530b93a51f2f/master/pass/Solairus-Aviation-private-plane-cr-courtesy.jpg",
  "http://static6.businessinsider.com/image/559d6ba869bedd4674eccdd9/hundreds-of-private-planes-have-descended-on-sun-valley-for-this-years-summer-camp-for-billionaires.jpg",
  "http://static5.businessinsider.com/image/5823653e691e88284e8b4fcc/checkout-gulfstreams-next-generation-45-million-g500-private-jet.jpg",
  "http://everydaytalks.com/wp-content/uploads/2015/01/largest-private-jets.png",
  "https://static.businessinsider.com/image/550b418b69bedd26499c3e26/image.jpg",
  "https://fm.cnbc.com/applications/cnbc.com/resources/img/editorial/2013/02/06/100439818-private-jet-interior-gettyP.jpg?v=1360771855",
  "https://i.pinimg.com/originals/c6/27/d8/c627d8ad79dc06ac08b153375b2bc650.jpg",
  "https://privejets.com/images-new/private-plane-turboprop-interior.jpg",
  "https://media.gqindia.com/wp-content/uploads/2016/10/GQ-India-Boeing-BBJ-interiors-edited.jpg",
  "https://static.businessinsider.com/image/550b418b69bedd26499c3e26/image.jpg",
  "http://static5.businessinsider.com/image/5823653e691e88284e8b4fcc/checkout-gulfstreams-next-generation-45-million-g500-private-jet.jpg",
  "http://site.privatejetdaily.com/wp-content/uploads/2013/06/private-jet1.jpg",
  "https://www.aircharter.com/wp-content/uploads/2014/10/CH-650.png",
  "https://i.pinimg.com/originals/e6/0e/01/e60e01bfa3a02d45a0547430c5b5ad64.jpg",
  "https://ecsjets.com/images/header_plane3.jpg"]
  def generate_jets(user)
    Jet.create(user_id: user.id,
      plane_model: JET_MODELS.sample,
      seat_number: rand(7..20),
      production_year: rand(1990..2017),
      wifi: rand > 0.5,
      meal: MEAL.sample,
      description: "A plane with wings",
      photo_urls: IMAGES.sample(3)
      )
    puts "Jet created for jet owner #{user.id}"
  end

  # do not delete these mother fucker!!!
  a = User.create(username: "bentheman",
      email: "benoitmrejen@gmail.com",
      password:"123456",
      phone: Faker::PhoneNumber.cell_phone,
      jet_owner: true
      # first_name: "Ben"
      # last_name: "The Man"
      )
  generate_jets(a)

  User.create(username: "harrisontheman",
      email: "cj_918@hotmail.com",
      password:"123456",
      phone: Faker::PhoneNumber.cell_phone,
      jet_owner: false
      # first_name: "Harrison"
      # last_name: "The Man"
      )
  # till here don't touch, i need it for testing





  # puts "CREATING 6 USERS AND 4 JET OWNERS"

  # 10.times do |x|
  #   puts "CREATING USER #{x} OF 10"
  #   a = User.create(username: Faker::Internet.user_name,
  #     email: Faker::Internet.email,
  #     password:"123456",
  #     phone: Faker::PhoneNumber.cell_phone,
  #     jet_owner: x < 4
  #     )
  #   generate_jets(a) if a.jet_owner
  # end

  puts "OK! CREATING 3 FLIGHTS"
  3.times do
    Flight.create(user_id: User.first.id,
      jet_id: Jet.first.id,
      origin: "Shanghai",
      destination: "Beijing",
      departure: "2017/12/01 14:00:00".to_datetime,
      arrival: "2017/12/01 16:00:00".to_datetime,
      price: rand(4_000...30_000),
      capacity: 10,
      status: "On time"
      )
  end

  jetcount = Jet.count
  Jet.all.each_with_index do |jet, i|
    puts "CREATING 10 FLIGHTS FOR JET NO. #{i} OF #{jetcount}"
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

  puts 'OK! CREATING BOOKINGS'

  flight_count = Flight.all.count
  Flight.all.each_with_index do |flight, i|
    puts "Seeding Bookings and Reviews for flight no. #{i} of #{flight_count}"
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
  puts "SEEDING FINISHED!"
