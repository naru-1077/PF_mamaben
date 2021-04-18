# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'admin@gmail.com',
  password: '000000'
  )

User.create!(
  name: 'なる',
  email: 'naru@naru',
  password: '000000',
  withdraw_status: 'false'
)