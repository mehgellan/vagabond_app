# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
  # movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
  User.create(first_name: 'Luke', last_name: 'Skywalker', email: 'Luke123@aol.com', image: 'stock', city: 'Mos Eisley', state: 'Tatooine',  )
  City.create(city: "San Francisco", state: "California", country: "USA")
