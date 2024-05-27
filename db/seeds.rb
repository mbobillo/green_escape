# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

users = User.create([
  { first_name: 'Marion', last_name: 'Bobillo', email: 'marion.bobillo@gmail.com', password: '123456' },
  { first_name: 'Amelie', last_name: 'Caron', email: 'caron.amelie94@gmail.com', password: '123456' },
  { first_name: 'Edgar', last_name: 'Meier', email: 'edgar.meier@swordagency.com', password: '123456' },
  { first_name: 'Kenzo', last_name: 'Defoy', email: 'kenzo.defoy@gmail.com', password: '123456' }
])

accomodations = Accomodation.create([
  {
    title: 'Cozy Cabin',
    description: 'A small, cozy cabin in the woods.',
    price: 100.00,
    images: 'cabin.jpg',
    localisation: 'Forest',
    environment_tag: 'countryside',
    capacity: 4,
    user: users.first
  },
  {
    title: 'Beach House',
    description: 'A beautiful house by the beach.',
    price: 200.00,
    images: 'beach_house.jpg',
    localisation: 'Beach',
    environment_tag: 'seaside',
    capacity: 8,
    user: users.last
  }
])

experiences = Experience.create([
  { title: 'Kayaking Adventure', description: 'Kayak through the river', type: 'Adventure', price: 50.00 },
  { title: 'Wine Tasting', description: 'Taste local wines', type: 'Relaxation', price: 75.00 }
])

bookings = Booking.create([
  {
    start_date: '2024-06-01',
    end_date: '2024-06-07',
    accomodation: accomodations.first,
    user: users.first,
    experience: experiences.first
  },
  {
    start_date: '2024-07-10',
    end_date: '2024-07-15',
    accomodation: accomodations.last,
    user: users.last,
    experience: experiences.last
  }
])
