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
User.destroy_all
Accomodation.destroy_all
Booking.destroy_all

users = User.create!([
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
    images: 'https://unsplash.com/photos/view-photography-of-triangular-house-in-forest-eMNRPvvNcxM',
    localisation: 'Forest',
    environment_tag: 'countryside',
    capacity: 4,
    user: users.first
  },
  {
    title: 'Beach House',
    description: 'A beautiful house by the beach.',
    price: 200.00,
    images: 'https://unsplash.com/photos/white-and-brown-wooden-2-storey-house-0zy0QwHwZy8',
    localisation: 'Beach',
    environment_tag: 'seaside',
    capacity: 8,
    user: users.last
  }
])

bookings = Booking.create([
  {
    start_date: '2024-06-01',
    end_date: '2024-06-07',
    accomodation: accomodations.first,
    user: users.first
  },
  {
    start_date: '2024-07-10',
    end_date: '2024-07-15',
    accomodation: accomodations.last,
    user: users.last
  }
])
