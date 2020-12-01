# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"
require_relative 'scraping'

Equipment.destroy_all

title = scraping_title

a = (2000..10000).to_a

links = [
  "https://source.unsplash.com/H5aZzaiW_xk",
  "https://source.unsplash.com/27_ARYvu9YY",
  "https://source.unsplash.com/UVxd5b-_tw8",
  "https://source.unsplash.com/DIGO6xmZ5jg",
  "https://source.unsplash.com/FpYX2jXImNk",
]
# links[n]

# 5.times do |n|
5.times do |n|

  puts "Creating Equipment using seed..."
  equipment = Equipment.new(name: title.first[:name],
    description: title.first[:description],
    available: true,
    price_per_day: a.sample,
    user: User.last
    )
  equipment.save!

  file = URI.open(links[n])
  equipment.photo.attach(io: file, filename: "0000#{n}.png", content_type: 'image/png')

  title.shift
end
