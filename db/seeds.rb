User.create(
  name: "Maribeth",
  email: "maribeth@email.com",
  password: "password",
  farmer: true)

# User.new(
#   name: "Maribeth",
#   password: "password",
#   email: "maribeth@email.com",
#   farmer: true)


User.create(
  name: "Al",
  email: "al@email.com",
  password: "password",
  password_confirmation: "password",
  farmer: true)

User.create(
  name: "Katy",
  email: "katy@email.com",
  password: "password",
  password_confirmation: "password",
  farmer: true)

User.create(
  name: "Remi",
  email: "remi@email.com",
  password_confirmation: "password",
  password: "password",
  foodie: true)

User.create(
  name: "Rhunell",
  email: "rhunell@email.com",
  password: "password",
  password_confirmation: "password",
  foodie: true)

User.create(
  name: "Marian",
  email: "marian@email.com",
  password: "password",
  password_confirmation: "password",
  foodie: true)

User.create(
  name: "Don",
  email: "don@email.com",
  password: "password",
  farmer: true)

Farm.create(
    name: "Red Sled Farm",
    email: User.first.email,
    user: User.first,
    phone: "1233453456",
    address: "234 Old Farm Rd.",
    city: "Sliding Rock",
    state: "NC",
    zip: "28768",
    latitude: 35.3110,
    longitude: -82.7873)

Farm.create(
    name: "Red Barn Farm",
    email: User.last.email,
    user: User.last,
    phone: "1233453456",
    address: "456 Lost Hollar",
    city: "Todd",
    state: "NC",
    zip: "28684",
    latitude: 36.3094,
    longitude: -81.5953)

Farm.create(
    name: "Red Shed Farm",
    email: User.second.email,
    user: User.second,
    phone: "1233453456",
    address: "567 Slip Stitch Pass",
    city: "Moss Gap",
    state: "NC",
    zip: "28906",
    latitude: 35.2367463,
    longitude: -84.1896395)

Farm.create(
    name: "Red Boot Farm",
    email: User.third.email,
    user: User.third,
    phone: "1233453456",
    address: "908 Hop Skip Jump Cir",
    city: "Burnt Chimney",
    state: "NC",
    zip: "28043",
    latitude: 35.4408,
    longitude: -82.2528)

Market.create(
  farm: Farm.first,
  day_of_week: "Monday",
  location: "on the corner")

Market.create(
  farm: Farm.second,
  day_of_week: "Tuesday",
  location: "at the end of the sidewalk")

Market.create(
  farm: Farm.second,
  day_of_week: "Wednesday",
  location: "in the parking lot")

Market.create(
  farm: Farm.first,
  day_of_week: "Thursday",
  location: "at your house")

Product.create(
  farm: Farm.second,
  item: "barley",
  quantity: "bushel",
  price: 3.75,
  expiration: Date.new(2009,9,14,8))

Product.create(
  farm: Farm.third,
  item: "malt",
  quantity: "bushel",
  price: 4.25,
  expiration: Date.new(2009,9,14,8))

Product.create(
  farm: Farm.fourth,
  item: "hops",
  quantity: "bushel",
  price: 5.37,
  expiration: Date.new(2009,9,14,8))

Product.create(
  farm: Farm.first,
  item: "bottles",
  quantity: "case",
  price: 1.24,
  expiration: Date.new(2009,9,14,8))

Product.create(
  farm: Farm.last,
  item: "bottle caps",
  quantity: "bushel",
  price: 17.54,
  expiration: Date.new(2009,9,14,8))
