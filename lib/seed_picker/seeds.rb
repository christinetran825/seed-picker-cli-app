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

  # parent_letter => parent_seeds: parent_seed_name
    #{A: ["Amaranth", "Artichoke & Cardoon", "Asparagus"]}
  # parent_seed => parent_description: , varieties: variety_name
    #{Amaranth: {parent_description: blah, varieties: 1.blah 2.blah 3.blah}
  # variety_name => variety_description:, price:
    # {"1.blah" => {variety_description: blah, price: $$$ }

  def self.get_description
    the_seeds = self.all.collect do |seeds|
      # "#{seeds.parent_seed_name} => #{seeds.parent_description}"
      puts "#{seeds.parent_seed_name} => #{seeds.parent_seed_url}"
    end
    # the_seeds.collect.with_index(1) do |key, index|
    #   puts "#{index}. #{key}"
    # end
  end



# binding.pry



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
