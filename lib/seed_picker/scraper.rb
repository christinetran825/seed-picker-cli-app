class SeedPicker::Scraper

binding.pry

  def self.scrape_parent_seeds #scraping the parent seed for the url, url_id, parent_seed_name, and letter
    doc = Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/"))
    doc.css(".sitebody .grid_4 h3.itemTitle a").collect do |the_seeds|
      seed = SeedPicker::Seeds.new ##!!!!! CALLING a new instance OBJECT !!!!!!!!
      seed.parent_seed_url = the_seeds["href"]
      seed.parent_seed_name = the_seeds.text
      seed.parent_letter = the_seeds.text[0]
        finder = Nokogiri::HTML(open(seed.parent_seed_url))
        finder.css(".sitebody .grid_9 .mainContent div#CT_Main_0_pnlHeading").collect do |the_details|
          seed.veggie_description = the_details.css(".sectionDesc p").text.gsub(/\r\n\t/, "") #description
        end
        finder.css(".sitebody .grid_9 .mainContent .hawksearch .grid_4").collect do |the_info|
          seed.variety_name = the_info.css("h3.itemTitle a").text #variety name
          seed.price = the_info.css(".itemMiniCart .itemPrice").text #variety price
        end
      seed
    end
  end

end
