class SeedPicker::Scraper

  def get_page
    doc = Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/"))
    binding.pry
    # doc.css(".sitebody").first.css(".grid_4").first.css(".itemTitle a").attr('href').value #link of Parent seed
    # doc.css(".sitebody").first.css(".grid_4").first.css(".itemTitle a").text ##Name of Parent Seed
  end

  # scrape_ _index
  #   self.get_page.css
  #
  #   scrape_ _index.each

  def get_seeds
    self.get_page.css(".sitebody")
  end

  # def make_seeds
  #   self.get_seeds.each do |seeds|
  #
  #
  #   end
  # end

  # def show_seeds
  #   self.make_seeds
  #   SeedPicker::Seeds.all.each do |seeds|
  #
  #
  #   end
  #
  # end

# SeedPicker::Scraper.new.show_seeds

end
