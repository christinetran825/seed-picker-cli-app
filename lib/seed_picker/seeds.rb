class SeedPicker::Seeds

  attr_accessor :parent_name, :variety_name, :description, :price, :url

  @@all =[]

  def initialize(parent_name=nil, variety_name=nil, description=nil, price=nil, url=nil)
    @parent_name = parent_name
    @variety_name = variety_name
    @description = description
    @price = price
    @url = url
  end

  # def self.scrape_seeds
  #   # Go to Main Vegetable Seed page, find the parent seed
  #   # extract properties, group seeds by first letter of name
  #   # instantiate a new seed
  #     #go to variety vegetable seed
  #   seeds = []
  #   seeds << self.scrape_parent_seeds
  #   seeds << self.scrape_variety_seeds
  #   seeds
  # end
  #
  # def self.scrape_parent_seeds
  #   SeedPicker::Scraper.new.print_seeds
  # end


  # def self.scrape_variety_seeds
  #   set = Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/amaranth/"))
  #
  #   seed = self.new
  #   seed.description = set.css(".sitebody .grid_9 .mainContent").first.css("div#CT_Main_0_pnlHeading .sectionDesc p").first.text #description
  #   # seed.parent_name = set.css(".sitebody .grid_9 .mainContent .hawksearch").first.css('title').text #parent seed name
  #   seed.variety_name = set.css(".sitebody .grid_9 .mainContent .hawksearch .grid_4").first.css("h3.itemTitle a").text #variety name
  #   seed.price = set.css(".sitebody .grid_9 .mainContent .hawksearch .grid_4").first.css(".itemMiniCart .itemPrice").text #variety price
  #
  #   seed
  #
  # end

end
