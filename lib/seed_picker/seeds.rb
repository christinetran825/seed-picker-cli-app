class SeedPicker::Seeds

  attr_accessor :parent_seed_name, :parent_seed_description, :variety_name, :variety_name_description, :price, :parent_seed_url, :variety_seed_url

  @@all = []

  def initialize(parent_seed_name=nil, parent_seed_description=nil, variety_name=nil, variety_name_description=nil, price=nil, parent_seed_url=nil, variety_seed_url=nil)
    @parent_seed_name = parent_seed_name
    @parent_seed_description = parent_seed_description
    @variety_name = variety_name
    @variety_name_description = variety_name_description
    @price = price
    @parent_seed_url = parent_seed_url
    @variety_seed_url = variety_seed_url
  end

  

  # def self.scrape_variety_seeds
  #   set = Nokogiri::HTML(open(url))
  #
  #   seed = self.new
  #   seed.parent_seed_description = set.css(".sitebody .grid_9 .mainContent").first.css("div#CT_Main_0_pnlHeading .sectionDesc p").first.text #description
  #   # set.css(".sitebody .grid_9 .mainContent .hawksearch").first.css('title').text #parent seed name
  #   seed.variety_name = set.css(".sitebody .grid_9 .mainContent .hawksearch .grid_4").first.css("h3.itemTitle a").text #variety name
  #   seed.price = set.css(".sitebody .grid_9 .mainContent .hawksearch .grid_4").first.css(".itemMiniCart .itemPrice").text #variety price
  #
  #   seed
  #
  # end

end
