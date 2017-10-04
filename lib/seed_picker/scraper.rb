class SeedPicker::Scraper

# binding.pry

  def self.scrape_parent_seeds #scraping the parent seed for the url and parent_seed_name
    doc = Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/"))
    doc.css(".sitebody ul.lnav li a").collect do |the_seeds|
      seed = SeedPicker::Seeds.new ##!!!!! CALLING a new instance OBJECT !!!!!!!!
      seed.parent_seed_url = the_seeds.attribute("href").value
      seed.parent_seed_name = the_seeds.text
      seed
    end
  end

  def self.scrape_variety_seeds(seed) #passing an instance of SeedPicker::Seeds.new which is how we get the seed.parent_seed_url from the previous method
    doc = Nokogiri::HTML(open("http://www.rareseeds.com" + seed.parent_seed_url))
    # binding.pry
    seed.parent_seed_description_a = doc.css(".sitebody .mainContent p").children.first.text.gsub(/\r\n\t/,"") #melons, peppers, squash, gourds, tomatoes
    seed.parent_seed_description_b = doc.css(".sitebody .mainContent .sectionDesc").text.strip.gsub(/\r\n\r\n/,"\n") #garlic, ground cherries
    seed.parent_seed_description_c = doc.css(".sitebody .mainContent .sectionDesc p").first.text.strip #all other seeds, salad blends
    # doc.css(".sitebody .mainContent p").collect do |the_details|
      # seed.parent_seed_description = the_details.css(".sectionDesc p").text.gsub(/\r\n\t/,"") #parent_description
    # end
    doc.css(".sitebody .mainContent .itemWrapper").collect do |the_details|
      seed = SeedPicker::Varieties.new ##!!!!! CALLING a new instance OBJECT !!!!!!!!
      seed.variety_seed_name = the_details.css("h3.itemTitle a").text #variety name
      seed.variety_seed_url = the_details.css("h3.itemTitle a").attribute("href").value #variety url
      seed.price = the_details.css(".itemMiniCart .itemPrice").text #variety price
    end
  end

  def self.scrape_variety_details(variety) #passing an instance of SeedPicker::Seeds.new which is how we get the seed.parent_seed_url from the previous method
    doc = Nokogiri::HTML(open(variety.variety_seed_url))
    variety.variety_seed_description = doc.css(".sitebody .mainContent .longDescription").text.strip.gsub(/\r\n/, "")
  end

end
