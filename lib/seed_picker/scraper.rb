class SeedPicker::Scraper
  # binding.pry
  def get_page
    Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/"))
  end

  def get_seeds
    self.get_page.css(".sitebody .grid_4 h3.itemTitle")
  end

  def make_seeds
    # binding.pry
    self.get_seeds.collect.with_index do |the_seeds, idx|
      seed_link = the_seeds['href']
      seed_name = the_seeds.inner_text
      seed_name
      # idx += 1
      # "(#{idx}). #{seed_name}"
    end
  end

  def print_seeds
    parent_seeds = self.make_seeds.group_by { |first_letter, idx| first_letter[0] }
    parent_seeds.each do |key, value|
      group_seeds = {}
      group_seeds[key] = "#{value.join(" , ")}"
      group_seeds
    end
  end

end

# SeedPicker::Scraper.new.print_seeds => lists all the vegetable seeds in grouped letters as a hash. parent seeds are grouped in an array
# SeedPicker::Scraper.new.print_seeds["A"] = ["Amaranth", "Artichoke & Cardoon", "Asparagus"]
