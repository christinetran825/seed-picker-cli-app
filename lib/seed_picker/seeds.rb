class SeedPicker::Seeds

  attr_accessor :name, :description, :price, :url

  @@all =[]

  def initialize(name=nil, description=nil, price=nil, url=nil)
    @name = name
    @description = description
    @price = price
    @url = url
  end

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

  def self.today
    seed_1 = self.new
    seed_1 = name = "the first seed"
    seed_1 = description "place text"
    seed_1 = price "$2.50"
    seed_1 = url = "the link"

    seed_2 = self.new
    seed_2 = name = "the 2nd seed"
    seed_2 = description "place another text"
    seed_2 = price "$4.50"
    seed_2 = url = "the other link"

    [seed_1, seed_2]
  end

end
