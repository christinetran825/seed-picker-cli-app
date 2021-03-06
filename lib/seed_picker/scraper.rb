class SeedPicker::Scraper

  def self.scrape_parent_seeds #scraping the parent seed for the url and parent_seed_name
    doc = Nokogiri::HTML(open("https://www.rareseeds.com/store/vegetables/"))
    doc.css(".sitebody ul.lnav li a").collect do |the_seeds|
      seed = SeedPicker::Seeds.new ##!!!!! CALLING a new instance OBJECT !!!!!!!!
      seed.parent_seed_url = the_seeds.attribute("href").value
      seed.parent_seed_name = the_seeds.text
      seed
    end
  end

  ####### separates the parent seeds with consistent structures from seeds with inconsistent HTML formats #######
  def self.scrape_parent_seeds_descriptions(seed) #passing an instance of SeedPicker::Seeds.new which is how we get the seed.parent_seed_url from the previous method
    doc = Nokogiri::HTML(open("https://www.rareseeds.com" + seed.parent_seed_url))
    case seed.parent_seed_name
    when "Garlic" || "Salad Blends" #garlic, ground cherries
      seed.parent_seed_description = doc.css(".sitebody .mainContent div#CT_Main_0_pnlHeading").first.text.strip.gsub(/\r\n\r\n/,"\n \n")\
    when "Ground Cherries"
      seed.parent_seed_description = doc.css(".sitebody .mainContent .sectionDesc").text.strip
    when "Gourds"
      seed.parent_seed_description = doc.css(".sitebody .mainContent p").children.first.text.gsub(/\r\n\t/,"")
    when "Melon"  #no descriptions
      seed.parent_seed_description = doc.css(".sitebody .mainContent p").first.text
    when "Peppers"  #no descriptions
      seed.parent_seed_description = doc.css(".sitebody .mainContent").first.css("p").first.text
    when "Squash"  #no descriptions
      seed.parent_seed_description = doc.css(".sitebody .mainContent p").children.first.text.strip
    when "Tomatoes"
      seed.parent_seed_description = doc.css(".sitebody .mainContent p").children.first.text.strip
    else
      seed.parent_seed_description = doc.css(".sitebody .mainContent .sectionDesc p").first.text.strip #all other seeds
    end
  end

  def self.scrape_variety_seeds(seed) #passing an instance of SeedPicker::Seeds.new which is how we get the seed.parent_seed_url from the previous method
    doc = Nokogiri::HTML(open("https://www.rareseeds.com" + seed.parent_seed_url))
    doc.css(".sitebody .mainContent .itemWrapper").collect do |the_details|
      variety = SeedPicker::Varieties.new ##!!!!! CALLING a new instance OBJECT !!!!!!!!
      variety.variety_seed_name = the_details.css("h3.itemTitle a").text #variety name
      variety.variety_seed_url = the_details.css("h3.itemTitle a").attribute("href").value #variety url
      variety.price = the_details.css(".itemMiniCart .itemPrice").text #variety price
    end
  end

  def self.scrape_variety_details(variety) #passing an instance of SeedPicker::Seeds.new which is how we get the seed.parent_seed_url from the previous method
    doc = Nokogiri::HTML(open(variety.variety_seed_url))
    variety.variety_seed_description = doc.css(".sitebody .mainContent .longDescription").text.strip.gsub(/\r\n/, "")
  end

  ####### Seeds with inconsistent HTML formats - Gourds, Melon, Peppers, Squash, Tomatoes #######

  def self.scrape_category_varieties_description(variety)
    doc = Nokogiri::HTML(open(variety.variety_seed_url))
    variety.category_description = doc.css(".sitebody .mainContent .sectionDesc p").first.text.strip
  end

  def self.scrape_category_varieties(variety)
    doc = Nokogiri::HTML(open(variety.variety_seed_url))
    doc.css(".sitebody .mainContent .itemWrapper").collect do |seeds|
      group = SeedPicker::Grouped_Variety.new
      group.category_varieties_url = seeds.css("h3.itemTitle a").attribute('href').value
      group.category_varieties_name = seeds.css("h3.itemTitle a").text
      group.category_varieties_price = seeds.css(".itemMiniCart .itemPrice").first.text
    end
  end

  def self.scrape_category_varieties_details(group)
    doc = Nokogiri::HTML(open(group.category_varieties_url))
    group.category_varieties_description = doc.css(".sitebody .mainContent .longDescription").text.strip.gsub(/\r\n/, "")
  end

end
