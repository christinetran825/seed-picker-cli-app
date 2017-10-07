class SeedPicker::Grouped_Variety

  attr_accessor :category_url, :category_description, :category_varieties_url, :category_varieties_name, :category_varieties_description, :category_varieties_price
  @@all = []

  def initialize #new instances have the below methods/properties
    @category_url = category_url
    @category_description = category_description
    @category_varieties_url = category_varieties_url
    @category_varieties_name = category_varieties_name
    @category_varieties_description = category_varieties_description
    @category_varieties_price = category_varieties_price
    @@all << self #all instances get added into @@all array
  end

  def self.all
    @@all #shows all instances as an array
  end

 ############### List ALL VARIETY Seeds ###############

  def self.get_category_variety(groups) #getting all grouped variety seeds
    self.all.collect.with_index(1) do |seeds, index|
      "   #{index}. #{seeds.category_varieties_name}"
    end
  end

 ############### Find Grouped_Variety Seeds ###############

  def self.find(num) #gets grouped_variety seed
    self.all[num-1] #objects are listed starting at 0
  end

end
