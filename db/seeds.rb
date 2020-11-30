# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a = (20..100).to_a

Equipment.new(name: Faker::Job.title,
  description: Faker::Job.field,
  available: true,
  price_per_day: a.sample,
  user: User.first
  )

