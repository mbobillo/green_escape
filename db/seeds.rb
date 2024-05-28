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
Booking.destroy_all
Accomodation.destroy_all
User.destroy_all

users = User.create!([
  { first_name: 'Marion', last_name: 'Bobillo', email: 'marion.bobill@gmail.com', password: '123456' },
  { first_name: 'Amelie', last_name: 'Caron', email: 'caron.amelie4@gmail.com', password: '123456' },
  { first_name: 'Edgar', last_name: 'Meier', email: 'edgar.meir@swordagency.com', password: '123456' },
  { first_name: 'Kenzo', last_name: 'Defoy', email: 'kenzo.deoy@gmail.com', password: '123456' }
])

accomodations = Accomodation.create([
  {
    title: 'Cozy Cabin',
    description: 'A small, cozy cabin in the woods.',
    price: 200.00,
    images: 'https://images.unsplash.com/photo-1573812331441-d99117496acb?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    localisation: 'Brinklow Rd, Binley, Coventry CV3 2AB, United Kingdom',
    environment_tag: 'countryside',
    category: 'cabin',
    capacity: 6,
    user: users.first
  },
  {
    title: 'Beautiful yurt',
    description: 'A beautiful modern yurt in peaceful village up in the mountain.',
    price: 100.00,
    images: 'https://www.glamping.com/static/media/uploads/property/Brush%20Creek%20Ranch/Brush%20Creek%20Ranch%20Yurt.jpg',
    localisation: 'Mursley Rd, Little Horwood, Milton Keynes MK17 0PH, United Kingdom',
    environment_tag: 'mountain',
    category: 'yurt',
    capacity: 4,
    user: users.last
  },
  {
    title: 'Peaceful container home',
    description: 'A high-end contanier home in a vast quiet garden near the sea.',
    price: 180.00,
    images: 'https://images.surferseo.art/30085e36-1fe9-478f-963d-57dfc1bbfabf.webp',
    localisation: '38 The Promenade, Southport, PR8 1QU, United Kingdom',
    environment_tag: 'seaside',
    category: 'container',
    capacity: 5,
    user: users.last
  },
  {
    title: 'Cute tiny house',
    description: 'A cocoon of love in a heavenly garden near the city.',
    price: 110.00,
    images: 'https://images.unsplash.com/photo-1595525101922-d7febbdd796d?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    localisation: '50 Arundel Gate, Sheffield, S1 2PR, United Kingdom',
    environment_tag: 'city',
    category: 'tiny house',
    capacity: 2,
    user: users.last
  },
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
