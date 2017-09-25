class SeedPicker::Scraper
binding.pry
  def get_page
    Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/"))
  end

  def get_seeds
    self.get_page.css(".sitebody .grid_4 h3.itemTitle")
  end

  def make_seeds
    # binding.pry
    self.get_seeds.collect.with_index do |the_seeds|
      seed_link = the_seeds['href']
      seed_name = the_seeds.inner_text
      seed_name
      # idx += 1
      # "(#{idx}). #{seed_name}"
    end
  end

  def group_parent_seeds #lists all the seeds grouped by first letters in a hash
    group_by_letter = self.make_seeds.group_by { |first_letter| first_letter[0] }
    group_by_letter.collect do |key, value|
      "#{key}: #{value}"
    end
  end

  def choosen_parent_seed
    
  end

  SeedPicker::Scraper.new.choosen_parent_seed
end

# SeedPicker::Scraper.new.print_seeds => lists all the vegetable seeds in grouped letters as a hash. parent seeds are grouped in an array
# SeedPicker::Scraper.new.print_seeds["A"] = ["Amaranth", "Artichoke & Cardoon", "Asparagus"]
