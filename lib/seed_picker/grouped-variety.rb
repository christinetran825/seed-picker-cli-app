class SeedPicker::Grouped_Variety

  attr_accessor :category_varieties_url, :category_varieties_name, :category_varieties_description, :category_varieties_price

  @@all = []

  def initialize
    @category_varieties_url = category_varieties_url
    @category_varieties_name = category_varieties_name
    @category_varieties_description = category_varieties_description
    @category_varieties_price = category_varieties_price
    @@all << self
  end

  def self.all
    @@all
  end

 ############### List ALL VARIETY Seeds ###############

  def self.get_category_variety(variety)
    self.all.collect.with_index(1) do |seeds, index|
      puts "   #{index}. #{seeds.category_varieties_name}"
    end
  end

 ############### Find Grouped_Variety Seeds ###############

  def self.find(num)
    self.all[num-1]
  end

end
