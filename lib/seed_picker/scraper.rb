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

  def self.scrape_parent_seeds_descriptions(seed) #passing an instance of SeedPicker::Seeds.new which is how we get the seed.parent_seed_url from the previous method
    doc = Nokogiri::HTML(open("http://www.rareseeds.com" + seed.parent_seed_url))
    # binding.pry
    case seed.parent_seed_name
    when "Garlic" || "Ground Cherries" || "Salad Blends" #garlic, ground cherries
      seed.parent_seed_description = doc.css(".sitebody .mainContent div#CT_Main_0_pnlHeading").first.text.strip.gsub(/\r\n\r\n/,"\n \n")
    when "Gourds" || "Melons" || "Peppers"  || "Squash" || "Tomatoes" #gourds, melons, peppers, squash, tomatoes; no descriptions
      #there's no description from website
      seed.parent_seed_description = doc.css(".sitebody .mainContent p").children.first.text.gsub(/\r\n\t/,"")
    else
      seed.parent_seed_description = doc.css(".sitebody .mainContent .sectionDesc p").first.text.strip #all other seeds
    end
    # seed.parent_seed_description_a = doc.css(".sitebody .mainContent p").children.first.text.gsub(/\r\n\t/,"") #gourds, melons, peppers, squash, gourds, tomatoes
    # seed.parent_seed_description_b = doc.css(".sitebody .mainContent div#CT_Main_0_pnlHeading").first.text.strip.gsub(/\r\n\r\n/,"\n \n") #garlic
    # # seed.parent_seed_description_b = doc.css(".sitebody .mainContent div#CT_Main_0_pnlHeading").first.text.strip #ground cherries
    # # seed.parent_seed_description_b = doc.css(".sitebody .mainContent div#CT_Main_0_pnlHeading p").first.text.strip #salad blends
    # seed.parent_seed_description_c = doc.css(".sitebody .mainContent .sectionDesc p").first.text.strip #all other seeds
  end

  #
  # case seed.parent_seed_name
  # when "Garlic" || "Ground Cherries" || "Salad Blends" #garlic, ground cherries
  #   puts "#{seed.parent_seed_description_b}"
  # when "Gourds" || "Melons" || "Peppers"  || "Squash" || "Tomatoes" #gourds, melons, peppers, squash, tomatoes; no descriptions
  #   #there's no description from website
  #   puts "#{seed.parent_seed_description_a}"
  #   puts ""
  #   # if seed.parent_seed_description_c == nil
  #   #   puts "Select a variety to view descriptions."
  #   # end
  # else
  #   puts "#{seed.parent_seed_description_c}" #all seeds
  # end


  def self.scrape_variety_seeds(seed) #passing an instance of SeedPicker::Seeds.new which is how we get the seed.parent_seed_url from the previous method
    doc = Nokogiri::HTML(open("http://www.rareseeds.com" + seed.parent_seed_url))
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

end
