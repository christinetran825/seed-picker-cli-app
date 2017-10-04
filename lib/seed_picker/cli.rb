class SeedPicker::CLI

  def call
    SeedPicker::Scraper.scrape_parent_seeds #CLI calls on the scraper class to tell Nokogiri to scrape the website
    puts ""
    puts "* * * Welcome to Baker Creek Heirloom Seeds RareSeeds * * * "
    puts ""
    start
  end

  ############ Helper Methods ############

  def list_varieties(seed)
    puts SeedPicker::Varieties.get_varieties(seed).compact
  end

  def print_parent_details(seed)
    puts ""
    puts " ----- Group: #{seed.parent_seed_name[0]} - #{seed.parent_seed_name} ----- "
    puts ""
    puts " Varieties: " # user sees a list of all parent seeds with an index of 1.
    # list_varieties(seed)
    puts ""
    puts " 1. #{seed.variety_seed_name}    2. #{seed.variety_seed_name}     3. #{seed.variety_seed_name}    4. #{seed.variety_seed_name}"
    puts " 5. #{seed.variety_seed_name}     6. #{seed.variety_seed_name}     7. #{seed.variety_seed_name}    8. #{seed.variety_seed_name}"
    puts " 9. #{seed.variety_seed_name}     10. #{seed.variety_seed_name}"
    puts ""
    puts " Description: "
    puts ""
    puts "#{seed.parent_seed_description}"
    puts ""
  end

  def print_variety_details(seed)
    puts "-------- Group #{letter}: #{seed.parent_seed_name} - #{seed.variety_seed_name} --------" # user sees a list of all parent seeds with an index of 1.
    puts ""
    puts "Price: #{seed.price} "
    puts ""
    puts "#{seed.variety_seed_description} "
    puts ""
  end

############ Start of Program ############

  def start
    puts "Here's our collection of vegetable seeds."
    puts ""
    puts "  ------------- Vegetable Seeds -------------"   # user sees a list of vegetable seeds
    SeedPicker::Seeds.listing_all_seeds
    choose_a_parent_seed
  end

  def choose_a_parent_seed #previous letter(user's input) is passed in
    puts ""
    puts "^ - ^ Please choose a seed by its number."
    num = gets.strip.to_i
    case num
    when (1..63)
      seed = SeedPicker::Seeds.find(num.to_i) #finding num(user's input) for the seed chosen from choose_a_letter method and NOT from the entire alpha
      # binding.pry
      # seed = SeedPicker::Seeds.find_details(letter, num.to_i) #finding num(user's input) for the seed chosen from choose_a_letter method and NOT from the entire alphabet.
      SeedPicker::Scraper.scrape_variety_seeds(seed) #calls the Scraper class method .scrape_variety_seeds & passes seed
      print_parent_details(seed)
      choose_list_of_variety
    when "DONE"
      goodbye
    # when "BACK"
    #   choose_a_letter
    else
      start
    end

  end

  def choose_list_of_variety
    puts ""
    puts "^ - ^ Please choose a variety by its number."
    input = gets.strip.to_i

    case input
    when (1..63)
      puts "testing"
      # print_variety_details(num)
      # puts "-------- Group #{letter}: #{seed.parent_seed_name} - #{seed.variety_seed_name} --------" # user sees a list of all parent seeds with an index of 1.
      # puts ""
      # puts "Price: #{seed.price} "
      # puts ""
      # puts "#{seed.variety_seed_description} "
      # puts ""
      go_back_or_finish
    when "DONE"
      goodbye
    # when "BACK"
    #   choose_a_parent_seed
    else
      choose_a_parent_seed
    end

  end

  def go_back_or_finish
    puts ""
    puts "^ _ ^ Type list if you want to choose another seed. Type done if you are done."
    input = gets.strip.to_s.upcase

    case input
    when "LIST"
      self.start
    when "DONE"
      goodbye
    else
      go_back_or_finish
    end

  end

  def goodbye
    puts ""
    puts "^ - ^ Goodbye!!!"
    puts ""
    puts "         ( Thank you for viewing our vegetable seed collection. Seed you again, soon!!! )"
    puts "          , "
    puts "  (\\ /)  , "
    puts "  ( . .)  "
    puts "  c(\")(\") "
    puts ""
  end

  # the_parent = SeedPicker::Seeds.find_details(letter, num.to_i) #finding num(user's input) for the seed chosen from choose_a_letter method and NOT from the entire alphabet.
  # seed = the_parent.downcase.split
  # seed_b = seed.join("-")
  # SeedPicker::Scraper.scrape_variety_seeds(seed_b) #calls the Scraper class method .scrape_variety_seeds & passes seed
  # # print_parent_details(seed)


end
