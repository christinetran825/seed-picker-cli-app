class SeedPicker::Seeds

  # binding.pry

  attr_accessor :letter, :parent_seed_name, :parent_seed_url
  # :parent_seed_description, :variety_name, :variety_name_description, :price, :variety_seed_url

  @@all = []

  def initialize
    @letter = letter
    @parent_seed_name = parent_seed_name
    @parent_seed_url = parent_seed_url
    # @@all << self
  end

  def self.all
    @@all
  end


end
