require "open-uri"
require_relative 'scraping'
Rental.destroy_all
Equipment.destroy_all
User.destroy_all

profile = 'https://www.flaticon.com/svg/static/icons/svg/599/599305.svg'

# Create Users

5.times do |n|
  pic = URI.open(profile)
  puts "Creating Users using seed..."
  user = User.new(username: "user#{n}",
    email: "user#{n}@gmail.com",
    password: "123456")

  user.photo.attach(io: pic, filename: "pic#{n}.png", content_type: 'image/png')
  user.save!
end

title = equipment_seed
a = (2000..10000).to_a

links = [
  "https://source.unsplash.com/H5aZzaiW_xk",
  "https://source.unsplash.com/27_ARYvu9YY",
  "https://source.unsplash.com/UVxd5b-_tw8",
  "https://source.unsplash.com/DIGO6xmZ5jg",
  "https://source.unsplash.com/FpYX2jXImNk",
]

9.times do |n|

  puts "Creating Equipment using seed..."
  equipment = Equipment.new(name: title.first[:name],
    description: title.first[:description],
    available: true,
    price_per_day: a.sample,
    user: User.all.sample,
    category: title.first[:category]
    )
  word = title.first[:name].split(' ').join(',')
  file = URI.open("https://source.unsplash.com/random?#{word}")
  equipment.photo.attach(io: file, filename: "0000#{n}.png", content_type: 'image/png')
  equipment.save!
  title.shift
end
puts "Equipment Seeding done"


puts "Rental Seeding"
5.times do |n|
  # file = URI.open(links[n])
  puts "Creating Rental using seed..."
  rental = Rental.new(
    start_date: DateTime.parse("#{n+1}/12/2020 17:00"),
    end_date: DateTime.parse("#{n+2}/12/2020 17:00"),
    price: a.sample,
    user: User.all.sample
    )
  rental.equipment = Equipment.all.sample
  rental.save!
end

puts "Rental Seeding done"


#  create_table "rentals", force: :cascade do |t|
#     t.integer "price"
#     t.date "start_date"
#     t.date "end_date"
#     t.bigint "equipment_id", null: false
#     t.bigint "user_id", null: false
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.index ["equipment_id"], name: "index_rentals_on_equipment_id"
#     t.index ["user_id"], name: "index_rentals_on_user_id"
#   end
