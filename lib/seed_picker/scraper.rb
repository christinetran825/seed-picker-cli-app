class SeedPicker::Scraper

# binding.pry

  attr_accessor :parent_letter, :parent_seed_name, :parent_seed_url, :parent_seed_url_id, :veggie_description, :variety_name, :price

  def self.scrape_parent_seeds #scraping the parent seed for the url, url_id, parent_seed_name, and letter
    doc = Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/"))
    doc.css(".sitebody .grid_4 h3.itemTitle a").collect do |the_seeds|
      seed = SeedPicker::Seeds.new ##!!!!! CALLING a new instance OBJECT !!!!!!!!
      seed.parent_seed_url = the_seeds['href']
      seed.parent_seed_url_id= the_seeds['id']
      seed.parent_seed_name = the_seeds.inner_text
      seed.parent_letter = the_seeds.inner_text[0]
      seed
    end
  end

  # def self.scrape_variety_seeds
  #   set = Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/artichoke-cardoon/"))
  #   set.css(".sitebody .grid_9 .mainContent").collect do |varieties|
  #   variety = {}
  #     variety[:parent_seed_description] = varieties.css("div#CT_Main_0_pnlHeading .sectionDesc p").first.inner_text.gsub(/\r\n\t/, "") #description
  #     # set.css(".sitebody .grid_9 .mainContent .hawksearch").first.css('title').text #parent seed name
  #     variety[:variety_name] = varieties.css(".hawksearch .grid_4 h3.itemTitle a").first.inner_text #variety name
  #     variety[:price] = varieties.css(".hawksearch .grid_4 .itemMiniCart .itemPrice").first.inner_text #variety price
  #   variety
  #   end
  # end

end
