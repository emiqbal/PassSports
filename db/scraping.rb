require 'nokogiri'
require 'open-uri'

def scraping_title

  product_title = []

  doc = Nokogiri::HTML(File.open("db/DECATHLON.html"))

  doc.search('.h3.product-title').each do |element|
     product_title << element.text.strip.downcase.capitalize
  end
  product_title
end
