# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Place.destroy_all

Place.create(
  name: 'Washington',
  state: 'DC',
  zip: '20018',
  rent: 2481
)

Place.create(
  name: 'Decatur',
  state: 'AL',
  zip: '35601',
  rent: 754
)
