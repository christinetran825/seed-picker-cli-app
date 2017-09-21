class SeedPicker::Scraper

  doc = Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/"))
  binding.pry
  # scrape_ _index
  #   self.get_page.css
  #
  #   scrape_ _index.each
end
