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

  def self.group_parents_by_letter #grouping parents by their letters
    the_seeds = self.all.collect { |seeds| seeds.parent_seed_name }
    lists = the_seeds.group_by { |letter| letter[0] } #becomes a hash grouped by first letter
  end

  def self.show_all_seeds_by_letter #listing all vegetable seeds grouped by first letter
    self.group_parents_by_letter.each do |key, value| #iterates the hash
      puts "#{key}: #{value}"
    end
  end

  # #a parent has a name, url, description, varieties
  # def self.the_parents
  #   self.all.collect do |seeds|
  #     seeds.parent_seed_name
  #     seeds.parent_seed_description
  #     seeds.parent_seed_url
  #     seeds.variety_seed_name
  #   end
  # end
  #
  # #a variety has a name, url, description, price
  # def self.the_varieties
  #   self.all.collect do |seeds|
  #     seeds.variety_seed_name
  #     seeds.variety_seed_description
  #     seeds.variety_seed_url
  #     seeds.price
  #   end
  # end


end
