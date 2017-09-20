class SeedPicker::CLI

  def call
    #SeedPicker::Scraper.new.
    puts "Welcome to Baker Creek Heirloom Seeds RareSeeds."
    list_seeds
  end

  def list_seeds
    puts "Vegetable Seeds"
    # puts ""
  end

  def choose_seeds
    puts "Which vegetable seed would you like to view? A-E, F-J, K-O, P-T, U-Z?"
    input = gets.strip.to_s.upcase
  end

end
