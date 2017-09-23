class SeedPicker::Scraper

  # binding.pry

    # Go to Main Vegetable Seed page, find the parent seed
    # extract properties, group seeds by first letter of name
    # instantiate a new seed

    #go to variety vegetable seed

  # Main Vegetable Seed page
  # doc = Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/"))
  # doc.css(".sitebody .grid_4").first.css("h3.itemTitle").first.css("a").attr('href').value #Link of Parent seed
  # doc.css(".sitebody .grid_4").first.css("h3.itemTitle").first.css("a").text ##Name of Parent Seed
  # doc.css(".sitebody .grid_4").collect.with_index do |the_seeds, idx|
  #   seed_link = the_seeds.css("h3.itemTitle a").attr('href').value
  #   seed_name = the_seeds.css("h3.itemTitle a").text
  #   "(#{idx}). #{seed_name}"
  # end

  # Variety Vegetable Seed Page - URL attr
  # set = Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/amaranth/"))
  # set.css(".sitebody .grid_9 .mainContent").first.css("div#CT_Main_0_pnlHeading .sectionDesc p").first.text #description
  # set.css(".sitebody .grid_9 .mainContent .hawksearch").first.css('title').text #parent seed name
  # set.css(".sitebody .grid_9 .mainContent .hawksearch .grid_4").first.css("h3.itemTitle a").text #variety name
  # set.css(".sitebody .grid_9 .mainContent .hawksearch .grid_4").first.css(".itemMiniCart .itemPrice").text #variety price

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

####

  # def make_links
  #   # binding.pry
  #   # variety = Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/"))
  #   self.get_seeds.collect.with_index do |the_seeds, idx|
  #     # grouped_seeds = SeedPicker::Seeds.new
  #     link_and_name = {}
  #     seed_link = the_seeds.css("h3.itemTitle a").attr('href').value
  #     seed_name = the_seeds.css("h3.itemTitle a").text
  #     link_and_name["#{seed_name}".to_sym] = "#{seed_link}"
  #     link_and_name
  #     # idx += 1
  #     # "(#{idx}). #{seed_name}"
  #   end
  # end

end

SeedPicker::Scraper.new.print_seeds
