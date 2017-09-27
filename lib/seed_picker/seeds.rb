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
    binding.pry
    self.all.collect do |veggie|
      puts "#{veggie.parent_letter} : #{veggie.parent_seed_name}"
    end
  end

  def self.parent_seed #listing all parent_seeds by index upon user input
    self.all.collect.with_index(1) do |veggie, index|
      puts "#{index}. #{veggie.parent_seed_name}"
    end
  end


## Scraping the variety details
  #
  def self.scrape_variety_seeds
    variety = self.all.collect do |veggie| veggie.parent_seed_url end
    Nokogiri::HTML(open(self.parent_seed_url))

  end

  def veggie_description
    @veggie_description ||= .css(".sitebody .grid_9 .mainContent div#CT_Main_0_pnlHeading .sectionDesc p").first.inner_text.gsub(/\r\n\t/, "") #description
  end

  def variety_name
    @variety_name ||= .css(".sitebody .grid_9 .mainContent .hawksearch .grid_4 h3.itemTitle a").first.inner_text #variety name
  end

  def price
    @price ||= .css(".sitebody .grid_9 .mainContent .hawksearch .grid_4 .itemMiniCart .itemPrice").first.inner_text  #variety price
  end

end
