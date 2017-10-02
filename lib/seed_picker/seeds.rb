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
    @@all << self
  end

  def self.all
    @@all
  end

  # def save
  #   @@all << self #all instances get added into @@all array
  # end

  def self.get_parents
    self.all.collect { |seeds| seeds.parent_seed_name }
  end

  def self.group_by_letter #grouping parents by their letters
    self.get_parents.group_by { |letter| letter[0] } #becomes a hash grouped by first letter
  end

  def self.get_letter(input)#grouping parents by their letters
    self.group_by_letter[input]
  end

  def self.listing_all_seeds #listing all vegetable seeds grouped by first letter
    self.group_by_letter.each do |key, value| #iterates the hash
      puts "#{key}: #{value}"
    end
  end

  def self.testing(input)
    group = self.get_parents
    group.select do |name|
      name.start_with?(input)
    end
  end
  
end
