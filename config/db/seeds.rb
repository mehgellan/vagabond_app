cities_data = [
  {city: "San Francisco", state: "California", country: "USA", image: "https://hd.unsplash.com/photo-1450149632596-3ef25a62011a"},
  {city: "Chicago", state: "Illinois", country: "USA", image: "http://static1.squarespace.com/static/546a7122e4b0b5dd39a15b64/t/546adb64e4b0fc11a01c39f7/1416289128048/Chicago.png"},
  {city: "New York City", state: "New York", country: "USA", image: "http://www.worldpropertyjournal.com/news-assets/Lower-Manhattan-sunset-New-York-City-keyimage.png"},
  {city: "London", state: nil, country: "England", image: "http://thecoffeevine.com/wp-content/uploads/2016/04/london.jpg"},
  {city: "Gibraltar", state: nil, country: "Spain", image: "http://www.rondatoday.com/wp-content/uploads/2011/11/gibraltar.jpg"},
  {city: "Kotor", state: nil, country: "Montenegro", image: "https://upload.wikimedia.org/wikipedia/commons/2/26/20090719_Crkva_Gospa_od_Zdravlja_Kotor_Bay_Montenegro.jpg"},
  {city: "Nashville", state: "Tennessee", country: "USA", image: "http://cdn.mntm.me/20/65/f4/Nashville_skyline-Nashville-Tennessee-2065f4d27cb74f4c8a7932a659dea4dd_c.jpg"},
  {city: "Mumbai", state: nil, country: "India", image: "http://s1.it.atcdn.net/wp-content/uploads/2015/03/48-hours-in-Mumbai-6.jpg"},
  {city: "Rotterdam", state: nil, country: "Netherlands", image: "http://www.100resilientcities.org/page/-/100rc/img/cities/cities-rotterdam_optimized.jpg"},
  {city: "Oklahoma City", state: "Oklahoma", country: "USA", image: "http://www.architecturalrecord.com/ext/resources/archives/features/2012/American-City/Oklahoma/Oklahoma-City-essay-main.jpg"},
  {city: "Detroit", state: "Michigan", country: "USA", image: "http://media.navigatored.com/images/detroit3.jpg"},
  {city: "Austin", state: "Texas", country: "USA", image: "http://intelligenttravel.nationalgeographic.com/files/2015/11/dowtown-austin-skyline-590-590x393.jpg"},
]

  User.create(first_name: 'Luke', last_name: 'Skywalker', email: 'Luke123@aol.com', image: 'stock', city: 'Mos Eisley', state: 'Tatooine')
  City.create(cities_data)
