class SeedPicker::Scraper

  def self.scrape_parent_seeds #scraping the parent seed for the url, url_id, parent_seed_name, and letter
    doc = Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/"))
    doc.css(".sitebody .grid_4 h3.itemTitle a").collect do |the_seeds|
      seed = SeedPicker::Seeds.new ##!!!!! CALLING a new instance OBJECT !!!!!!!!
      seed.parent_seed_url = the_seeds["href"]
      seed.parent_seed_name = the_seeds.text
      seed.parent_letter = the_seeds.text[0]
            finder = Nokogiri::HTML(open(seed.parent_seed_url))
            finder.css(".sitebody .grid_9 .mainContent").collect do |the_details|
              seed.veggie_description = finder.css("div#CT_Main_0_pnlHeading .sectionDesc p").text.gsub(/\r\n\t/, "") #description
              seed.variety_name = finder.css(".hawksearch .grid_4 h3.itemTitle a").text #variety name
              seed.price = finder.css(".hawksearch .grid_4 .itemMiniCart .itemPrice").text  #variety price
            end
      seed
    end
  end


end
