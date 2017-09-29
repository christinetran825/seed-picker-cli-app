class SeedPicker::Seeds

  attr_accessor :parent_seed_name, :parent_seed_url, :parent_description, :variety_url, :variety_description, :variety_name, :price

  @@all = []

  # def initialize #new instances have the below methods/properties
  #   @parent_seed_name = parent_seed_name
  #   @parent_seed_url = parent_seed_url
  #   @parent_description = parent_description
  #   @variety_name = variety_name
  #   @variety_url = variety_url
  #   @variety_description = variety_description
  #   @price = price
  #   @@all << self #all instances get added into @@all array
  # end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.show_all_seeds_by_letter #listing all vegetable seeds grouped by first letter
    group = self.all.collect do |veggie|
      array = []
      array = "#{veggie.parent_seed_name}"
      array
    end
    the_group = group.group_by { |s| s[0] } #becomes a hash grouped by first letter
    the_group.each do |key, value| #iterates the hash
      puts "#{key}: #{value}"
    end
  end


  # def self.parent_seed
  #   input = gets.strip.to_s.upcase
  #   group = self.show_all_seeds_by_letter
  #   list = group[input]
  #   list.collect.with_index(1) do |the_info, index|
  #     "#{index}. #{the_info}"
  #   end
  # end

# binding.pry
#
#   s = SeedPicker::Seeds.new


  # def self.get_description
  #   parents = self.parent_seed
  #   parents.collect.with_index(1) do |the_info, index|
  #     "#{index}. #{the_info}"
  #     # puts "#{the_info.parent_description}"
  #   end
  # end

  def self.get_parent_description
    @veggie_description
  end

  def self.variety_seed
    self.all.collect.with_index(1) do |the_info, index|
      puts "#{index}. #{the_info.variety_name}"
    end
  end

  def self.variety_seed_info
    self.all.collect.with_index(1) do |the_info, index|
      puts "#{index}. #{the_info.price}"
    end
  end

  def self.variety_seed_description
    self.all.collect.with_index(1) do |the_info, index|
      puts "#{index}. #{the_info.variety_description}"
    end
  end

end
