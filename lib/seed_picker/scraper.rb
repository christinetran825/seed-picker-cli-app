class SeedPicker::Scraper

binding.pry

  def self.scrape_parent_seeds
    doc = Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/"))
    doc.css(".sitebody .grid_4 h3.itemTitle a").collect do |the_seeds|
      hash = {}
      hash[:parent_seed_url] = the_seeds['href']
      hash[:url_id] = the_seeds['id']
      hash[:parent_seed_name] = the_seeds.inner_text
      hash[:letter] = the_seeds.inner_text[0]
      hash
    end
  end

  def self.scrape_variety_seeds
    set = Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/artichoke-cardoon/"))
    set.css(".sitebody .grid_9 .mainContent").collect do |varieties|
    variety = {}
      variety[:parent_seed_description] = varieties.css("div#CT_Main_0_pnlHeading .sectionDesc p").first.inner_text.gsub(/\r\n\t/, "") #description
      # set.css(".sitebody .grid_9 .mainContent .hawksearch").first.css('title').text #parent seed name
      variety[:variety_name] = varieties.css(".hawksearch .grid_4 h3.itemTitle a").first.inner_text #variety name
      variety[:price]= varieties.css(".hawksearch .grid_4 .itemMiniCart .itemPrice").first.inner_text #variety price
    variety
    end
  end


 #  # binding.pry

 # def print_seeds #lists all the seed grouped in letters in a hash
 #   grouped_seeds = self.make_seeds.group_by do |seed|
 #     seed[0]
 #   end
 #   grouped_seeds.collect do |key, value|
 #     "#{key} = #{value}"
 #   end
 # end
 #  def list_parents
 #    grouped_seeds = self.make_seeds.group_by do |seed|
 #      seed[0]
 #    end
 #    hash = {}
 #    grouped_seeds.each do |key, value|
 #      hash[key] = value
 #    end
 #    hash
 #  end
 #
 #  def choose_parent_seed
 #    input = gets.strip.to_s.upcase
 #    parent_seeds = self.list_parents[input]
 #    parent_seeds.collect.with_index(1) do |key, index|
 #      "#{index}. #{key}"
 #    end
 #  end
 #
 # SeedPicker::Scraper.new.choose_parent_seed

end


# SeedPicker::Scraper.new.print_seeds => lists all the vegetable seeds in grouped letters as a hash. parent seeds are grouped in an array
# SeedPicker::Scraper.new.print_seeds["A"] = ["Amaranth", "Artichoke & Cardoon", "Asparagus"]
