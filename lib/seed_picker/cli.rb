class SeedPicker::CLI

  def call
    SeedPicker::Scraper.scrape_parent_seeds #CLI calls on the scraper class to tell Nokogiri to scrape the website
    puts ""
    puts "* * * Welcome to Baker Creek Heirloom Seeds RareSeeds * * * "
    puts ""
    start
  end

  ############ Helper Methods ############

  def print_parent_seeds(letter)
    puts ""
    puts " ----- You chose Group: #{letter} ----- " # user sees a list of all parent seeds with an index of 1.
    puts ""
    puts SeedPicker::Seeds.show_parents(letter).compact
  end

  def print_parent_details(seed)
    puts ""
    puts " ----- Group: #{seed.parent_seed_name[0]} - #{seed.parent_seed_name} ----- "
    puts ""
    puts " Varieties: " # user sees a list of all parent seeds with an index of 1.
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

# def print_variety_details(seed)
  # puts "-------- Group #{letter}: #{seed.parent_seed_name} - #{seed.variety_seed_name} --------" # user sees a list of all parent seeds with an index of 1.
  # puts ""
  # puts "Price: #{seed.price} "
  # puts ""
  # puts "#{seed.variety_seed_description} "
  # puts ""
  #end

############ Start of Program ############

  def start
    puts "Here's our collection of vegetable seeds."
    puts ""
    puts "  ------------- Vegetable Seeds -------------"   # user sees a list of vegetable seeds
    SeedPicker::Seeds.listing_all_seeds
    choose_a_letter
  end

  def choose_a_letter
    puts ""
    puts "^ - ^ Please choose a group of seeds by its letter from A-Z."
    puts ""
    letter = gets.strip.to_s.upcase
    case letter
    when ("A".."Z")
      print_parent_seeds(letter) #passes the letter(user's input) to this helper method to print out results
      choose_a_parent_seed(letter) #passes the letter(user's input) to the next method/step of the program
    when "DONE"
      goodbye
    else
      choose_a_letter
    end
  end

  def choose_a_parent_seed(letter) #previous letter(user's input) is passed in
    puts ""
    puts "^ - ^ Please choose a seed by its number."
    num = gets.strip.to_i
    case num
    when (1..10)
      # seed = SeedPicker::Seeds.find(num.to_i) #finding num(user's input) for the seed chosen from choose_a_letter method and NOT from the entire alphabet.
      seed = SeedPicker::Seeds.find_details(letter, num.to_i) #finding num(user's input) for the seed chosen from choose_a_letter method and NOT from the entire alphabet.
      SeedPicker::Scraper.scrape_variety_seeds(seed) #calls the Scraper class method .scrape_variety_seeds & passes seed
      print_parent_details(seed)
      # parent_name = SeedPicker::Seeds.get_descriptions(letter, num)
      choose_list_of_variety
    when "DONE"
      goodbye
    # when "BACK"
    #   choose_a_letter
    else
      choose_a_parent_seed
    end

  end

  def choose_list_of_variety
    puts ""
    puts "^ - ^ Please choose a variety by its number."
    input = gets.strip.to_i || input = gets.strip.to_s.upcase

    case input
    when (1..10)
      puts "testing"
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
      choose_list_of_variety
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



end
