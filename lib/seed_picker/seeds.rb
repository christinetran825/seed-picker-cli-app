class SeedPicker::Seeds



  attr_accessor :parent_letter, :parent_seed_name, :parent_seed_url, :veggie_description, :variety_name, :price

  @@all = []

  def initialize #new instances have the below methods/properties
    @parent_letter = parent_letter
    @parent_seed_name = parent_seed_name
    @parent_seed_url = parent_seed_url
    @veggie_description = veggie_description
    @variety_name = variety_name
    @price = price
    @@all << self #all instances get added into @@all array
  end

  def self.all
    @@all
  end

  def self.veggie_seed #listing all vegetable seeds grouped by first letter
    self.all.collect do |veggie|
      puts "#{veggie.parent_letter} : #{veggie.parent_seed_name}"
    end
  end

  def self.parent_seed #listing all parent_seeds by index upon user input
    self.all.collect.with_index(1) do |veggie, index|
      puts "#{index}. #{veggie.parent_seed_name}"
    end
  end

  binding.pry
  def self.scrape_parent_seeds #scraping the parent seed for the url, url_id, parent_seed_name, and letter
    doc = Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/"))
    doc.css(".sitebody .grid_4 h3.itemTitle a").collect do |the_seeds|
      seed = SeedPicker::Seeds.new ##!!!!! CALLING a new instance OBJECT !!!!!!!!
      seed.parent_seed_url = the_seeds["href"]
      seed.parent_seed_name = the_seeds.inner_text
      seed.parent_letter = the_seeds.inner_text[0]
            finder = Nokogiri::HTML(open(seed.parent_seed_url))
      seed.veggie_description = finder.css(".sitebody .grid_9 .mainContent div#CT_Main_0_pnlHeading .sectionDesc p").text.gsub(/\r\n\t/, "") #description
      seed.variety_name = finder.css(".sitebody .grid_9 .mainContent .hawksearch .grid_4 h3.itemTitle a").first.inner_text #variety name
      seed.price = finder.css(".sitebody .grid_9 .mainContent .hawksearch .grid_4 .itemMiniCart .itemPrice").first.inner_text  #variety price
      seed
    end
  end

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

# ## Scraping the variety details
#   #
#   def self.scrape_variety_seeds
#     variety = self.all.collect do |veggie| veggie.parent_seed_url end
#     Nokogiri::HTML(open(self.parent_seed_url))
#
#   end
#
#   def veggie_description
#     @veggie_description ||= .css(".sitebody .grid_9 .mainContent div#CT_Main_0_pnlHeading .sectionDesc p").first.inner_text.gsub(/\r\n\t/, "") #description
#   end
#
#   def variety_name
#     @variety_name ||= .css(".sitebody .grid_9 .mainContent .hawksearch .grid_4 h3.itemTitle a").first.inner_text #variety name
#   end
#
#   def price
#     @price ||= .css(".sitebody .grid_9 .mainContent .hawksearch .grid_4 .itemMiniCart .itemPrice").first.inner_text  #variety price
#   end

end
