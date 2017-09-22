class SeedPicker::Scraper

  # binding.pry

  def get_page
    # binding.pry
    doc = Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/"))

    # doc.css(".sitebody").first.css(".grid_4").first.css(".itemTitle a").attr('href').value #Link of Parent seed
    # doc.css(".sitebody").first.css(".grid_4").first.css(".itemTitle a").text ##Name of Parent Seed
  end

  def get_seeds
    self.get_page.css(".itemTitle a")
  end

  def make_seeds
    self.get_seeds.collect do |seeds|
      grouped_seeds = SeedPicker::Seeds.new
      grouped_seeds.parent_seed_link = seeds['href'] #Link of Parent seed
      grouped_seeds.parent_seed_name = seeds.text #Name of Parent seed
    end
  end

  def print_seeds
    self.make_seeds
    SeedPicker::Seeds.all.each do |grouped_seeds|
      puts "Seed Link: #{grouped_seeds.parent_seed_link}"
      puts "Seed Name: #{grouped_seeds.parent_seed_name}"
    end
  end

end

SeedPicker::Scraper.new.print_seeds
