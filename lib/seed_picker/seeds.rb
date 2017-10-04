class SeedPicker::Seeds

  attr_accessor :parent_seed_name, :parent_seed_url, :parent_seed_description, :variety_seed_name, :variety_seed_url, :variety_seed_description, :price

  @@all = []

  def initialize #new instances have the below methods/properties
    @parent_seed_name = parent_seed_name
    @parent_seed_url = parent_seed_url
    @parent_seed_description = parent_seed_description
    @variety_seed_name = variety_seed_name
    @variety_seed_url = variety_seed_url
    @variety_seed_description = variety_seed_description
    @price = price
    @@all << self #all instances get added into @@all array
  end

  def self.all
    @@all #shows all instances as an array
  end

  # def save
  #   @@all << self #all instances get added into @@all array
  # end

  ############### Helper Methods ###############

  def self.get_parents #getting all parent seeds
    # all_parents = self.all.collect { |seeds| seeds.parent_seed_name }
    # all_parents.sort { |a, b| a <=> b }
    all_parents = self.all.collect { |seeds| seeds.parent_seed_name }
    all_seeds = all_parents.sort { |a, b| a <=> b }
    all_seeds.delete("Bulk Vegetables")
    all_seeds.delete("Fall Favorites")
    all_seeds.delete("Melon") #try to add this manually?
    all_seeds.delete("New Items") #try to add this manually?
    all_seeds.delete("Slow Food's Ark of Taste") #try to add this manually?
    all_seeds.delete("Thai Varieties") #try to add this manually?
    all_seeds.delete("The Explorer Series") #try to add this manually?
    all_seeds.delete("Tomatoes") #try to add this manually?
    all_seeds.delete("Watermelon") #try to add this manually?
    all_seeds.delete("William Woys Weaver") #try to add this manually?
    # all_seeds.delete("Turnips") #try to add this manually?
    all_seeds
  end

  ############### Lists ALL Vegetable Seeds ###############

  def self.listing_all_seeds
    group = self.get_parents
    list_parents = group.collect.with_index(1) do |seed, index| puts "#{index}. #{seed}" end
  end

  ############### Print Parent Seeds Details ###############

  def self.find(num) #gets parent seed chosen from index from show_parents(letter) method
    self.all[num-1] #objects are listed starting at 0
  end

end
