class SeedPicker::Scraper

# binding.pry

  attr_accessor :parent_letter, :parent_seed_name, :parent_seed_url, :veggie_description, :variety_name, :price

  def self.scrape_parent_seeds #scraping the parent seed for the url, url_id, parent_seed_name, and letter
    doc = Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/"))
    doc.css(".sitebody .grid_4 h3.itemTitle a").collect do |the_seeds|
      seed = SeedPicker::Seeds.new ##!!!!! CALLING a new instance OBJECT !!!!!!!!
      seed.parent_seed_url = the_seeds['href']
      seed.parent_seed_name = the_seeds.inner_text
      seed.parent_letter = the_seeds.inner_text[0]
      seed
    end
  end

  # def self.scrape_variety_seeds
  #   set = Nokogiri::HTML(open(parent_seed_url))
  #   set.css(".sitebody .grid_9 .mainContent").collect do |the_types|
  #     varieties = SeedPicker::Seeds.new
  #     varieties.veggie_description = the_types.css("div#CT_Main_0_pnlHeading .sectionDesc p").first.inner_text.gsub(/\r\n\t/, "") #description
  #     # set.css(".sitebody .grid_9 .mainContent .hawksearch").first.css('title').text #parent seed name
  #     varieties.variety_name = the_types.css(".hawksearch .grid_4 h3.itemTitle a").first.inner_text #variety name
  #     varieties.price = the_types.css(".hawksearch .grid_4 .itemMiniCart .itemPrice").first.inner_text #variety price
  #     varieties
  #   end
  # end

end
