class SeedPicker::Scraper

  binding.pry

  # Main Vegetable Seed page
  # doc = Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/"))
  # doc.css(".sitebody .grid_4 h3.itemTitle").first.css("a").attr('href').value #Link of Parent seed
  # doc.css(".sitebody .grid_4 h3.itemTitle").first.css("a").inner_text ##Name of Parent Seed
  # doc.css(".sitebody .grid_4 h3.itemTitle").collect.with_index do |the_seeds, idx|
  #   seed_link = the_seeds['href']
  #   seed_name = the_seeds.inner_text
  #   "(#{idx}). #{seed_name}"
  # end

  # set = Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/amaranth/"))
  # set.css(".sitebody .grid_9 .mainContent").first.css("div#CT_Main_0_pnlHeading .sectionDesc p").first.text #description
  # set.css(".sitebody .grid_9 .mainContent .hawksearch").first.css('title').text #parent seed name
  # set.css(".sitebody .grid_9 .mainContent .hawksearch .grid_4").first.css("h3.itemTitle a").text #variety name
  # set.css(".sitebody .grid_9 .mainContent .hawksearch .grid_4").first.css(".itemMiniCart .itemPrice").text #variety price

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

# SeedPicker::Scraper.new.print_seeds
