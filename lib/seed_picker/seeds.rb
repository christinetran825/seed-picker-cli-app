class SeedPicker::Seeds
  binding.pry
  attr_accessor :parent_seed_name, :parent_seed_description, :variety_name, :variety_name_description, :variety_name_price, :url

  @@all =[]

  def initialize(parent_name=nil, variety_name=nil, description=nil, price=nil, url=nil)
    @parent_seed_name = parent_seed_name
    @parent_seed_description = parent_seed_description
    @variety_name = variety_name
    @variety_name_description = variety_name_description
    @variety_name_price = variety_name_price
    @url = url
  end

  def self.scrape_seeds
    # Go to Main Vegetable Seed page, find the parent seed
    # extract properties, group seeds by first letter of name
    # instantiate a new seed
      #go to variety vegetable seed
    seeds = []
    seeds << self.scrape_parent_seeds
    seeds << self.scrape_variety_seeds
    seeds
  end

  def self.scrape_parent_seeds
    # SeedPicker::Scraper.new.print_seeds
    doc = Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/"))

    seed = self.new
    # doc.css(".sitebody .grid_4 h3.itemTitle").first.css("a").attr('href').value #Link of Parent seed
    # doc.css(".sitebody .grid_4 h3.itemTitle").first.css("a").inner_text ##Name of Parent Seed
    seed.parent_seed_name = doc.css(".sitebody .grid_4 h3.itemTitle a").collect.with_index do |the_seeds, idx|
      # seed_link = the_seeds['href']
      seed_name = the_seeds.inner_text
      "(#{idx}). #{seed_name}"
    end
  end


  def self.scrape_variety_seeds
    set = Nokogiri::HTML(open("http://www.rareseeds.com/store/vegetables/amaranth/"))

    seed = self.new
    # set.css(".sitebody .grid_9 .mainContent").first.css("div#CT_Main_0_pnlHeading .sectionDesc p").first.text #description
    # set.css(".sitebody .grid_9 .mainContent .hawksearch").first.css('title').text #parent seed name
    # set.css(".sitebody .grid_9 .mainContent .hawksearch .grid_4").first.css("h3.itemTitle a").text #variety name
    # set.css(".sitebody .grid_9 .mainContent .hawksearch .grid_4").first.css(".itemMiniCart .itemPrice").text #variety price

    seed

  end

end
