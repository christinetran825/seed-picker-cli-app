class SeedPicker::Seeds

  attr_accessor :parent_letter, :parent_seed_name, :parent_seed_url, :parent_seed_url_id, :veggie_description, :variety_name, :price

  @@all = []

  def initialize #new instances have the below methods/properties
    @parent_letter = parent_letter
    @parent_seed_name = parent_seed_name
    @parent_seed_url = parent_seed_url
    @parent_seed_url_id = parent_seed_url_id
    @veggie_description = veggie_description
    @variety_name = variety_name
    @price = price
    @@all << self #all instances get added into @@all array
  end

  def self.all
    @@all
  end

  def self.veggie_seed #listing all vegetable seeds grouped by first letter
    self.all.collect do |veggie|
      puts "#{veggie.parent_letter} : #{veggie.parent_seed_name}"
    end
  end

  def self.parent_seed #listing all parent_seeds by index upon user input
    self.all.collect.with_index(1) do |veggie, index|
      puts "#{index}. #{veggie.parent_seed_name}"
    end
  end

  def self.parent_description
    self.all.collect do |veggie|
      veggie.parent_seed_url
    end
  end



end
