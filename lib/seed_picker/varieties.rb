class SeedPicker::Varieties

  attr_accessor :variety_seed_name, :variety_seed_url, :variety_seed_description, :price

  @@all = []

  def initialize #new instances have the below methods/properties
    @variety_seed_name = variety_seed_name
    @variety_seed_url = variety_seed_url
    @variety_seed_description = variety_seed_description
    @price = price
    @@all << self #all instances get added into @@all array
  end

  def self.all
    @@all #shows all instances as an array
  end

############### List ALL VARIETY Seeds ###############

  def self.get_varieties(seed) #getting all varieties seeds
    self.all.collect.with_index(1) do |seeds, index|
      puts "#{index}. #{seeds.variety_seed_name}"
    end
  end

############### Find Variety Seeds ###############

  def self.find(num) #gets variety seed
    self.all[num-1] #objects are listed starting at 0
  end

end
