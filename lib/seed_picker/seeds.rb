class SeedPicker::Seeds

  # binding.pry

  attr_accessor :letter, :parent_seed_name, :parent_seed_url, :parent_seed_description, :variety_name, :price

  @@all = []

  def initialize
    @letter = letter
    @parent_seed_name = parent_seed_name
    @parent_seed_url = parent_seed_url
    @parent_seed_description = parent_seed_description
    @variety_name = variety_name
    @price = price
    # @@all << self
  end

  def self.all
    @@all
  end
  #
  # def self.parent_seed
  #   @parent_seed_name
  # end

end
