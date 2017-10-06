class SeedPicker::Grouped_Variety

  attr_accessor :grouped_variety_url, :grouped_variety_name, :grouped_variety_description, :grouped_variety_varieties_url, :grouped_variety_varieties_name, :grouped_variety_varieties_description, :grouped_price
  @@all = []

  def initialize #new instances have the below methods/properties
    @grouped_variety_url = grouped_variety_url
    @grouped_variety_name = grouped_variety_name
    @grouped_variety_description = grouped_variety_description
    @grouped_variety_varieties_url = grouped_variety_varieties_url
    @grouped_variety_varieties_name = grouped_variety_varieties_name
    @grouped_variety_varieties_description = grouped_variety_varieties_description
    @grouped_price = grouped_price
    @@all << self #all instances get added into @@all array
  end

  def self.all
    @@all #shows all instances as an array
  end

 ############### List ALL VARIETY Seeds ###############

  def self.get_grouped_variety(groups) #getting all grouped variety seeds
    self.all.collect.with_index(1) do |seeds, index|
      "   #{index}. #{seeds.grouped_variety_varieties_name}"
    end
  end

 ############### Find Grouped_Variety Seeds ###############

  def self.find(num) #gets grouped_variety seed
    self.all[num-1] #objects are listed starting at 0
  end

end
