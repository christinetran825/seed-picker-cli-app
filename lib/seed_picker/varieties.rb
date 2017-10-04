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

############### Print List of Variety Seeds ###############

  def self.get_varieties(seed) #getting all varieties seeds
    the_varieties = self.all.collect.with_index(1) { |seeds, index| puts "#{index}. #{seeds.variety_seed_name}" }
    the_varieties
  end

############### Print Variety Seeds Details ###############
  def self.find(num) #gets variety seed
    self.all[num-1] #objects are listed starting at 0
  end

  def self.get_varieties_details(seed) #getting all varieties seeds
    puts "whoa"
  end

end
