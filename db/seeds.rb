# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require_relative 'scraping'

Equipment.destroy_all

title = scraping_title

a = (2000..10000).to_a

5.times do

  puts "Creating Equipment using seed..."
  equipment = Equipment.new(name: title.first,
    description: Faker::Job.field,
    available: true,
    price_per_day: a.sample,
    user: User.last
    )
  equipment.save!
  title.shift
end
