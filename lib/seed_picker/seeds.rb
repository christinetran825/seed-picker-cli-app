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
    @@all
  end

  def save
    @@all << self #all instances get added into @@all array
  end

  ############### Helper Methods ###############

  def self.get_parents #getting all parent seeds
    self.all.collect { |seeds| seeds.parent_seed_name }
  end

  def self.group_by_letter #grouping all parent seeds by their first letters
    group = self.get_parents
    abc_list = group.sort_by {|x| x[0]}
    abc_list.group_by { |letter| letter[0] } #returns a hash grouped by first letter
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
    list_parents.collect.with_index(1) do |the_info, index| # the results of the SeedPicker::Seeds.testing(input) method is saved as group variable. The group variable is iterated with index of 1.
      puts "  #{index}. #{the_info}"
    end
  end

  ############### Print Parent Seeds Details ###############

  def self.find_details(letter, num) #gets parent seed chosen from index from show_parents(letter) method
    group = self.group_by_letter
    group[letter][num - 1]
  end


end
