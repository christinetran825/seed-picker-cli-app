class SeedPicker::Scraper

  binding.pry
  #doc = Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/"))
  # doc.css(".sitebody .grid_4").first.css("h3.itemTitle").first.css("a").attr('href').value #Link of Parent seed
  # doc.css(".sitebody .grid_4").first.css("h3.itemTitle").first.css("a").text ##Name of Parent Seed
  # doc.css(".sitebody .grid_4").collect.with_index do |the_seeds, idx|
  #   seed_link = the_seeds.css("h3.itemTitle a").attr('href').value
  #   seed_name = the_seeds.css("h3.itemTitle a").text
  #   "(#{idx}). #{seed_name}"
  # end

  def get_page
    Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/"))
  end

  def get_seeds
    self.get_page.css(".sitebody .grid_4")
  end

  def make_seeds
    # binding.pry
    self.get_seeds.collect.with_index do |the_seeds, idx|
      # grouped_seeds = SeedPicker::Seeds.new
      seed_link = the_seeds.css("h3.itemTitle a").attr('href').value
      seed_name = the_seeds.css("h3.itemTitle a").text
      seed_name
      # idx += 1
      # "(#{idx}). #{seed_name}"
    end
  end

  def print_seeds
    self.make_seeds.group_by do |parent_seeds, idx|
      parent_seeds[0]
    end
  end

end


SeedPicker::Scraper.new.print_seeds
