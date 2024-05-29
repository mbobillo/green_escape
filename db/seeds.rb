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
  { first_name: 'Marion', last_name: 'Bobillo', email: 'marion.bobillo@gmail.com', password: '123456' },
  { first_name: 'Amelie', last_name: 'Caron', email: 'caron.amelie94@gmail.com', password: '123456' },
  { first_name: 'Edgar', last_name: 'Meier', email: 'edgar.meier@swordagency.com', password: '123456' },
  { first_name: 'Kenzo', last_name: 'Defoy', email: 'kenzo.defoy@gmail.com', password: '123456' }
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
    latitude: 52.411871,
    longitude:-1.409066,
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
    latitude: 51.958839,
    longitude: -0.843174,
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
    latitude: 53.648832,
    longitude: -3.008284,
    user: users[3]
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
    latitude: 53.379331,
    longitude: -1.467704,
    user: users[2]
  },
  {
    title: 'Cabin by the lake',
    description: 'A cabin in paradise, sitting on a quiet lake for the bewt experience of your life.',
    price: 250.00,
    images: 'https://www.cabanesdesgrandscepages.com/wp-content/uploads/2021/06/elsacyri_coucoograndscepages_low_32.jpg',
    localisation: '2 Stonehenge Road, Amesbury, SP4 8BN, United Kingdom',
    environment_tag: 'seaside',
    category: 'cabin',
    capacity: 4,
    latitude: 51.173553466796875,
    longitude: -1.7970980405807495,
    user: users.first
  },
  {
    title: 'Cabin in the trees',
    description: 'Scared of heights ? You should come experience our beautiful cabin in up the trees to change your mind !',
    price: 190.00,
    images: 'https://www.cabanesdesgrandschenes.com/wp-content/uploads/2015/12/CABANE-CANOPEE-COUCOO-GRANDS-CH%C3%8ANES-WEB-5.jpg',
    localisation: 'Harnham Road, Salisbury, United Kingdom',
    environment_tag: 'countryside',
    category: 'cabin',
    capacity: 2,
    latitude: 51.0612094,
    longitude: -1.8083641,
    user: users[1]
  },
  {
    title: 'Peaceful Cabin for big family',
    description: 'Welcome to paradise in our amazing cabin on the Sheffield lake. No neighbours, just you and your family.',
    price: 290.00,
    images: 'https://www.madmoisellejulie.fr/wp-content/uploads/2020/04/cabanes-coucoo-grands-cepages.jpg',
    localisation: 'Junction 15, M1, Loake Close, Grange Park, Northampton, NN4 5EZ, United Kingdom',
    environment_tag: 'countryside',
    category: 'cabin',
    capacity: 6,
    latitude: 52.185007,
    longitude: -0.891778,
    user: users[1]
  },
  {
    title: 'My tiny house cottage style',
    description: 'In a beautiful mountain, come and live in my tiny house for a couple of days to exprience respectful living.',
    price: 190.00,
    images: 'https://www.tinyhouse-company.fr/media/81/f1/30/1693569040/photo_2023-09-01%2014.49.39.jpeg',
    localisation: 'The Langdale Estate, Great Langdale, Ambleside LA22 9JD, United Kingdom',
    environment_tag: 'mountain',
    category: 'tiny house',
    capacity: 2,
    latitude: 54.437412,
    longitude: -3.041177,
    user: users[1]
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
