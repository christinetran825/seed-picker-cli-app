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
    self.get_seeds.collect do |the_seeds|
      seed_name = the_seeds.inner_text
      seed_name
    end
  end

  def print_seeds #lists all the seed grouped in letters in a hash
    letter_group = self.make_seeds.group_by do |seed|
      seed[0]
    end
  end

  # def make_parent_seed #user inputs a letter and method returns an array of parent seeds
  #   input = gets.strip.to_s.upcase
  #   self.print_seeds[input].collect.with_index(1) do |seed, index|
  #     "#{index}. #{seed}"
  #   end
  # end
  
end

# SeedPicker::Scraper.new.print_seeds => lists all the vegetable seeds in grouped letters as a hash. parent seeds are grouped in an array
# SeedPicker::Scraper.new.print_seeds["A"] = ["Amaranth", "Artichoke & Cardoon", "Asparagus"]
