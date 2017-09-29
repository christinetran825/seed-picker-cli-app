class SeedPicker::Scraper

# binding.pry

  def self.scrape_parent_seeds #scraping the parent seed for the url, url_id, parent_seed_name, and letter
    doc = Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/"))
    doc.css(".sitebody ul.lnav li a").collect do |the_seeds|
      seed = SeedPicker::Seeds.new ##!!!!! CALLING a new instance OBJECT !!!!!!!!
      seed.parent_seed_url = the_seeds["href"]
      seed.parent_seed_name = the_seeds.text
      seed.save
    end
  end

  def self.scrape_variety_seeds #(seed) #passing an instance of SeedPicker::Seeds.new which is how we get the seed.parent_seed_url from the previous method
    doc = Nokogiri::HTML(open("http://www.rareseeds.com" + seed.parent_seed_url))
    # doc = Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/amaranth/"))
    doc.css(".sitebody .mainContent").collect do |the_details|
      # seed = SeedPicker::Seeds.new
      seed.parent_description = the_details.css("div#CT_Main_0_pnlHeading").first.css(".sectionDesc p").first.text.strip #parent_description
      the_details.css("h3.itemTitle a").collect do |more_details|
        seed.variety_name = more_details.text #variety name
        seed.variety_url = more_details['href'] #variety url
      end
      # seed.variety_name = the_details.css("h3.itemTitle a").first.text #variety name
      # seed.variety_url = the_details.css("h3.itemTitle a")['href'] #variety url
      seed.price = the_details.css(".itemMiniCart .itemPrice").first.text #variety price
      seed.save
    end
  end

  #scrape variety details

  def self.scrape_variety_seeds #(seed)#passing an instance of SeedPicker::Seeds.new which is how we get the seed.parent_seed_url from the previous method
    doc = Nokogiri::HTML(open("http://www.rareseeds.com" + seed.variety_url))
    # doc = Nokogiri::HTML(open("http://www.rareseeds.com/aurelia-s-verde-amaranth/"))
    # seed = SeedPicker::Seeds.new
    seed.variety_description = doc.css(".sitebody .mainContent .longDescription").text.strip.gsub(/\r\n/, "")
    seed.save
  end

  # details.css(".sitebody .grid_9").first.css(".mainContent").first.css(".longDescription").text.strip.gsub(/\r\n/, "") #variety descriptions

    # def self.scrape_parent_seeds #scraping the parent seed for the url, url_id, parent_seed_name, and letter
    #   doc = Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/"))
    #   doc.css(".sitebody .grid_4 h3.itemTitle a").collect do |the_seeds|
    #     seed = SeedPicker::Seeds.new ##!!!!! CALLING a new instance OBJECT !!!!!!!!
    #     seed.parent_seed_url = the_seeds["href"]
    #     seed.parent_seed_name = the_seeds.text
    #       finder = Nokogiri::HTML(open(seed.parent_seed_url))
    #       finder.css(".sitebody .mainContent div#CT_Main_0_pnlHeading").collect do |the_details|
    #         seed.veggie_description = the_details.css("p").text.gsub(/\r\n\t/, "") #description
    #       end
    #       finder.css(".sitebody .hawksearch .grid_4").collect do |the_info|
    #         seed.variety_name = the_info.css("h3.itemTitle a").text #variety name
    #         seed.price = the_info.css(".itemMiniCart .itemPrice").text #variety price
    #       end
    #     seed
    #   end
    # end

end
