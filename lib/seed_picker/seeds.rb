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
    # @@all << self
  end

  def self.all
    # binding.pry
    @@all
  end

  def save
    @@all << self #all instances get added into @@all array
  end

  ############### Helper Methods ###############

  def self.get_parents #getting all parent seeds
    all_parents = self.all.collect { |seeds| seeds.parent_seed_name }
    all_parents.sort { |a, b| a <=> b }
  end

  def self.group_by_letter #grouping all parent seeds by their first letters  ###listing all veggie seeds
    group = self.get_parents
    group.group_by { |s| s[0,1] } #returns a hash grouped by first letter
  end

  def self.get_varieties #getting all parent seeds
    self.all.collect { |seeds| seeds.variety_seed_name }
  end

  ############### Lists ALL Vegetable Seeds ###############

  def self.listing_all_seeds #listing all vegetable seeds grouped from group_by_letter method hash
    self.group_by_letter.each do |key, value| #iterates the hash
      puts "#{key}: #{value}"
    end
  end

  ############### Print Parent Seeds ###############

  def self.show_parents(letter)
    list_parents = self.group_by_letter[letter] #input is being pased to the SeedPicker::Seeds.get_letter method where it's being passed into a hash as a key
    list_parents.collect.with_index(1) do |the_parent, index| # the results of the SeedPicker::Seeds.testing(input) method is saved as group variable. The group variable is iterated with index of 1.
      puts "  #{index}. #{the_parent}"
    end
  end

  ############### Print Parent Seeds Details ###############

  def self.find_details(letter, num) #gets parent seed chosen from index from show_parents(letter) method
    group = self.group_by_letter
    group[letter][num - 1]
  end

  def self.find(num) #gets parent seed chosen from index from show_parents(letter) method
    # binding.pry
    # self.all[num-1] #objects are listed starting at 0
    self.all[num] #objects are listed starting at 0
    # self.all #all objects are listed in an array with its instances

    #how to group each object by it's seed name's first letter?
  end

  def self.testing
    group = self.get_parents
    list_parents = group.collect.with_index(1) do |seed, index| puts "#{index}. #{seed}" end
  end

end
