class SeedPicker::Scraper
binding.pry
  def get_page
    Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/"))
  end

  def get_seeds
    self.get_page.css(".sitebody .grid_4 h3.itemTitle")
  end

  def make_seeds
    self.get_seeds.collect do |the_seeds|
      seed_name = the_seeds.inner_text
      seed_name
    end
  end

  def print_seeds #lists all the seed grouped in letters in a hash
    grouped_seeds = self.make_seeds.group_by do |seed|
      seed[0]
    end
    grouped_seeds.collect do |key, value|
      "#{key} = #{value}"
    end
  end

  # binding.pry
  def list_parents
    grouped_seeds = self.make_seeds.group_by do |seed|
      seed[0]
    end
    hash = {}
    grouped_seeds.each do |key, value|
      hash[key] = value
    end
    hash
  end

  def choose_parent_seed
    input = gets.strip.to_s.upcase
    parent_seeds = self.list_parents[input]
    parent_seeds.collect.with_index(1) do |key, index|
      "#{index}. #{key}"
    end
  end

 SeedPicker::Scraper.new.choose_parent_seed




end


# SeedPicker::Scraper.new.print_seeds => lists all the vegetable seeds in grouped letters as a hash. parent seeds are grouped in an array
# SeedPicker::Scraper.new.print_seeds["A"] = ["Amaranth", "Artichoke & Cardoon", "Asparagus"]
