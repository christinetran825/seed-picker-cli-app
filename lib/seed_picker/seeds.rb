class SeedPicker::Seeds



  attr_accessor :parent_letter, :parent_seed_name, :parent_seed_url, :veggie_description, :variety_url, :variety_description, :variety_name, :price

  @@all = []

  def initialize #new instances have the below methods/properties
    @parent_letter = parent_letter
    @parent_seed_name = parent_seed_name
    @parent_seed_url = parent_seed_url
    @veggie_description = veggie_description
    @variety_name = variety_name
    @variety_url = variety_url
    @variety_description = variety_description
    @price = price
    @@all << self #all instances get added into @@all array
  end

  def self.all
    @@all
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

  def self.show_parent_seed_by_letter #listing all parent_seeds by index upon user input

  end

  def self.parent_seed
  # binding.pry
    input = gets.strip.to_s.upcase
    # self.veggie_seed.collect.with_index(1) do |seed, index|
    #   puts "#{index}. #{seed}."
    # end
    # self.all.collect.with_index(1) do |veggie, index|
    #   puts "#{index}. #{veggie.parent_seed_name}"
    # end
  end

  def self.get_description
    self.all.collect do |the_info|
      puts "#{the_info.veggie_description}"
    end
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
