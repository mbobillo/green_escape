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
Experience.destroy_all

users = User.create!([
  { first_name: 'Marion', last_name: 'Bobillo', email: 'marion.bobillo@gmail.com', password: '123456' },
  { first_name: 'Amelie', last_name: 'Caron', email: 'caron.amelie94@gmail.com', password: '123456' },
  { first_name: 'Edgar', last_name: 'Meier', email: 'edgar.meier@swordagency.com', password: '123456' },
  { first_name: 'Kenzo', last_name: 'Defoy', email: 'kenzo.defoy@gmail.com', password: '123456' }
])

experiences = Experience.create([
  {
    title: "Rafting",
    description: "Experience the thrill of navigating through white water rapids with our exhilarating rafting adventures. Perfect for adrenaline seekers and nature lovers alike.",
    kind: "Sport",
    price: 150.00,
    image_url: "https://images.unsplash.com/photo-1629248457649-b082812aea6c?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    title: "Kayak",
    description: "Glide across serene waters in a canoe, exploring hidden coves and enjoying the peaceful surroundings. Ideal for those looking to unwind and connect with nature.",
    kind: "Sport",
    price: 150.00,
    image_url: "https://images.unsplash.com/photo-1521336575822-6da63fb45455?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    title: "Permaculture",
    description: "Discover sustainable living practices with our permaculture workshops. Learn how to create self-sufficient ecosystems that benefit both the environment and your lifestyle.",
    kind: "Science",
    price: 80.00,
    image_url: "https://images.unsplash.com/photo-1570142071296-d5903a62ab62?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    title: "Climbing",
    description: "Challenge yourself with our climbing activities, suitable for all levels. Scale natural rock formations and enjoy breathtaking views from the top.",
    kind: "Sport",
    price: 70.00,
    image_url: "https://images.unsplash.com/photo-1586627161720-ee2849303aee?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    title: "Horse Riding",
    description: "Embark on scenic trails and experience the joy of horse riding. Whether you're a beginner or an experienced rider, our guided tours offer something for everyone.",
    kind: "Experience",
    price: 100.00,
    image_url: "https://images.unsplash.com/photo-1600757490188-1eb2bab4cf4a?q=80&w=2959&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    title: "Speleology",
    description: "Explore the fascinating underground world with our potholing expeditions. Navigate through caves and discover the beauty hidden beneath the surface.",
    kind: "Experience",
    price: 60.00,
    image_url: "https://images.unsplash.com/photo-1656843799293-371c4e28d19b?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    title: "Natural Wine Testing",
    description: "Savor the unique flavors of natural wines with our guided tasting sessions. Learn about organic winemaking processes and enjoy a delightful sensory experience.",
    price: 80.00,
    image_url: "https://images.unsplash.com/photo-1519092796169-bb9cc75a4b68?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    title: "Wood Crafting",
    description: "Unleash your creativity with our wood crafting workshops. Learn traditional techniques and create beautiful, handmade wooden items to take home.",
    kind: "Kraftmanship",
    price: 75.00,
    image_url: "https://images.unsplash.com/photo-1590880795696-20c7dfadacde?q=80&w=2970&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    title: "Baking Mastercall",
    description: "Join our baking masterclass and refine your skills in the kitchen. From artisan breads to delectable pastries, learn the secrets of expert bakers.",
    kind: "Cooking",
    price: 150.00,
    image_url: "https://images.unsplash.com/photo-1576186726580-a816e8b12896?q=80&w=3164&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    title: "Farm Lifestyle",
    description: "Immerse yourself in the daily activities of farm life. From feeding animals to growing crops, experience the joys and challenges of sustainable farming.",
    kind: "Experience",
    price: 100.00,
    image_url: "https://images.unsplash.com/photo-1444858291040-58f756a3bdd6?q=80&w=2048&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  }
])

accomodations = Accomodation.create([
  {
    title: 'Cozy Cabin',
    description: 'A small, cozy cabin in the woods. Beautiful furniture and perfect comfort, in an extraordinay environment.',
    price: 200.00,
    images: 'https://images.unsplash.com/photo-1573812331441-d99117496acb?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    localisation: 'Brinklow Rd, Binley, Coventry CV3 2AB, United Kingdom',
    environment_tag: 'countryside',
    category: 'cabin',
    capacity: 6,
    latitude: 52.411871,
    longitude: -1.409066,
    user: users.first
  },
  {
    title: 'Beautiful yurt',
    description: 'A beautiful modern yurt in peaceful village up in the mountain. We live in a resilient way in the nature, and offer you to discover this beautiful way of life',
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
    description: 'A high-end contanier home in a vast quiet garden near the sea.Resilient living with minimu environmental footprint.',
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
    description: 'A cocoon of love in a heavenly garden near the city. An resilient living space with direct access to all services.',
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
    description: 'A cabin in paradise, sitting on a quiet lake for the best experience of your life. You can fit a family in our spacious cabin.',
    price: 250.00,
    images: 'https://media.istockphoto.com/id/1327080125/fr/photo/triangulaire-moderne-lake-house-%C3%A0-lautomne.jpg?s=1024x1024&w=is&k=20&c=shSQk40VouN-zug0RrHK1mSMDW6_FzqNjephArdRINU=',
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
    images: 'https://www.cabanes-de-france.com/wp-content/uploads/2022/07/cabanaspe2-1-scaled.jpg',
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

AccomodationExperience.create([
  {
    accomodation: accomodations[0],
    experience: experiences[0]
  },
  {
    accomodation: accomodations[1],
    experience: experiences[1]
  },
  {
    accomodation: accomodations[2],
    experience: experiences[2]
  },
  {
    accomodation: accomodations[3],
    experience: experiences[3]
  },
  {
    accomodation: accomodations[4],
    experience: experiences[4]
  },
  {
    accomodation: accomodations[5],
    experience: experiences[5]
  },
  {
    accomodation: accomodations[6],
    experience: experiences[6]
  },
  {
    accomodation: accomodations[7],
    experience: experiences[7]
  }
])

# bookings = Booking.create([
#   {
#     start_date: '2024-06-01',
#     end_date: '2024-06-07',
#     accomodation: accomodations.first,
#     user: users.first
#   },
#   {
#     start_date: '2024-07-10',
#     end_date: '2024-07-15',
#     accomodation: accomodations.last,
#     user: users.last
#   }
# ])
