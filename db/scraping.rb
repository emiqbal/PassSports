require 'nokogiri'
require 'open-uri'

def scraping_title

  product_title = []
  product_description = []

  doc = Nokogiri::HTML(File.open("db/DECATHLON.html"))

  doc.search('.h3.product-title').each do |element|
    product_title << element.text.strip.downcase.capitalize

    description_url = element.search('a').attribute('href').value

    html_file = open(description_url).read
    html_doc = Nokogiri::HTML(html_file)

    html_doc.search('.product-information').each do |e|
    product_description << e.search('.rte-content').first.text
    end
  end

  product_hash = []

  product_title.each_with_index do |product, index|
    product_hash << { name: product, description: product_description[index] }
  end
  product_hash
end

def equipment_seed

  product_title = ["DUMBBELL",
    "KETTLEBELL",
    "BENCH PRESS",
    "RESISTANCE BANDS",
    "PULL UP BAR",
    "BADMINTON RACKET",
    "SHUTTLECOCK",
    "BADMINTON NET",
    "TENNIS RACKET",
    "TENNIS BALL",
    "FOLDING STOOL",
    "CAMPING TENT",
    "FOLDING TABLE",
    "SLEEPING BAG",
    "TORCHLIGHT"]

  product_cat = ["Gym",
    "Gym",
    "Gym",
    "Gym",
    "Gym",
    "Racket",
    "Racket",
    "Racket",
    "Racket",
    "Racket",
    "Camping",
    "Camping",
    "Camping",
    "Camping",
    "Camping"]

  product_hash = []

  product_title.each_with_index do |product, index|
    product_hash << { name: product.capitalize,
      description: "#{product.capitalize} is well maintained and in great condition. You will absolutely love it. Lorem ipsum dolor sit amet consectetur adipisicing, elit. Repellendus, saepe?",
      category: product_cat[index] }
  end
  product_hash
end
