class SeedPicker::Scraper

# binding.pry

  def self.scrape_parent_seeds #scraping the parent seed for the url, url_id, parent_seed_name, and letter
    doc = Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/"))
    doc.css(".sitebody ul.lnav li a").collect do |the_seeds|
      seed = SeedPicker::Seeds.new ##!!!!! CALLING a new instance OBJECT !!!!!!!!
      seed.parent_seed_url = the_seeds.attribute("href").value
      seed.parent_seed_name = the_seeds.text
      seed.save
    end
  end

  def self.scrape_variety_seeds(seed) #passing an instance of SeedPicker::Seeds.new which is how we get the seed.parent_seed_url from the previous method
    # doc = Nokogiri::HTML(open("http://www.rareseeds.com" + seed.parent_seed_url))
    # doc = Nokogiri::HTML(open("http://www.rareseeds.com#{seed}")) # "http://www.rareseeds.com/store/vegetables/garden-berries/" #http://www.rareseeds.comGarden Berries (URI::InvalidURIError)
    doc = Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/#{seed}")) #http://www.rareseeds.com/store/vegetables/Garden Berries (URI::InvalidURIError)
    doc.css(".sitebody .mainContent").collect do |the_details|
      seed.parent_seed_description = the_details.css("div#CT_Main_0_pnlHeading").first.css(".sectionDesc p").first.text.strip #parent_description
      the_details.css("h3.itemTitle a").collect do |more_details|
        seed.variety_seed_name = more_details.text #variety name
        seed.variety_seed_url = more_details.attribute("href").value #variety url
      end
      seed.price = the_details.css(".itemMiniCart .itemPrice").first.text #variety price
    end
  end

  def self.scrape_variety_details(seed) #passing an instance of SeedPicker::Seeds.new which is how we get the seed.parent_seed_url from the previous method
    doc = Nokogiri::HTML(open("http://www.rareseeds.com" + seed.variety_seed_url))
    seed.variety_seed_description = doc.css(".sitebody .mainContent .longDescription").text.strip.gsub(/\r\n/, "")
  end

end
