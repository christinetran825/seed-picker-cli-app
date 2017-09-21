require 'pry'
require 'nokogiri'
require 'open-uri'

class SeedPicker::Scraper
  # binding.pry
  doc = Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/"))

end
