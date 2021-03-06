class SeedPicker::Seeds

  attr_accessor :parent_seed_name, :parent_seed_url, :parent_seed_description; :varieties
  @@all = []

  def initialize #new instances have the below methods/properties
    @varieties = []
    @@all << self #all instances get added into @@all array
  end

  def self.all
    @@all #shows all instances as an array
  end

  ############### Helper Methods ###############

  def self.get_varieties(seed)
    @varieties << seed
  end

  def self.get_parents #getting all parent seeds
    all_parents = self.all.collect { |seeds| seeds.parent_seed_name }
    all_seeds = all_parents.sort { |a, b| a <=> b }
    all_seeds.delete("Bulk Vegetables")
    all_seeds.delete("Fall Favorites")
    all_seeds.delete("New Items")
    all_seeds.delete("Slow Food's Ark of Taste")
    all_seeds.delete("Thai Varieties")
    all_seeds.delete("The Explorer Series")
    all_seeds.delete("William Woys Weaver")
    all_seeds
  end

  ############### Lists ALL Vegetable Seeds ###############

  def self.listing_all_seeds
    group = self.get_parents
    group.collect.with_index(1) do |seed, index|
      "#{index}. #{seed}"
    end
  end

  ############### Find Parent Seeds ###############

  def self.find(num) #gets parent seed
    self.all[num-1] #objects are listed starting at 0
  end

end
