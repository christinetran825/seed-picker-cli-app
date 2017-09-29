class SeedPicker::Seeds

  attr_accessor :parent_seed_name, :parent_seed_url, :parent_description, :variety_name, :variety_url, :variety_description, :price

  @@all = []

  def initialize #new instances have the below methods/properties
    @parent_seed_name = parent_seed_name
    @parent_seed_url = parent_seed_url
    @parent_description = parent_description
    @variety_name = variety_name
    @variety_url = variety_url
    @variety_description = variety_description
    @price = price
  end

  def self.all
    @@all
  end

  def save
    @@all << self #all instances get added into @@all array
  end

  def self.group_parents_by_letter #grouping parents by their letters
    the_seeds = self.all.collect do |seeds|
      seeds.parent_seed_name
    end
    lists = the_seeds.group_by { |letter| letter[0] } #becomes a hash grouped by first letter
  end

  def self.show_all_seeds_by_letter #listing all vegetable seeds grouped by first letter
    self.group_parents_by_letter.each do |key, value| #iterates the hash
      puts "#{key}: #{value}"
    end
  end

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

  # def self.get_parent_description
  #   @veggie_description
  # end
  #
  # def self.variety_seed
  #   self.all.collect.with_index(1) do |the_info, index|
  #     puts "#{index}. #{the_info.variety_name}"
  #   end
  # end
  #
  # def self.variety_seed_info
  #   self.all.collect.with_index(1) do |the_info, index|
  #     puts "#{index}. #{the_info.price}"
  #   end
  # end
  #
  # def self.variety_seed_description
  #   self.all.collect.with_index(1) do |the_info, index|
  #     puts "#{index}. #{the_info.variety_description}"
  #   end
  # end

end
