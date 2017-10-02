class SeedPicker::CLI

  def call
    SeedPicker::Scraper.scrape_parent_seeds #CLI calls on the scraper class to tell Nokogiri to scrape the website
    # binding.pry
    # all_seeds = SeedPicker::Seeds.all.clone
    # all_seeds.each do |seeds|
    #   SeedPicker::Scraper.scrape_variety_seeds(seeds)
    #   SeedPicker::Scraper.scrape_variety_details(seeds)
    # end
    puts "* * * Welcome to Baker Creek Heirloom Seeds RareSeeds * * * "
    puts ""
    list_of_seeds
    choose_a_letter
  end

  def all_seeds
    SeedPicker::Seeds.all
  end

  ############### getting the links ###############


  ############### Lists of Vegetable Seeds ###############

  def list_of_seeds
    puts "Here's our collection of vegetable seeds."
    puts ""
    puts "  ------------- Vegetable Seeds -------------"   # user sees a list of vegetable seeds
    SeedPicker::Seeds.listing_all_seeds
  end


  ############### MENU ###############

  def choose_a_letter
    puts ""
    puts "^ - ^ Please choose a group of seeds by its letter from A-Z for more details." # user is prompted with a demand
    puts ""
    input = gets.strip.to_s.upcase || input = gets.strip.to_i

    case input
    when ("A"..."Z")
      puts ""
      puts " ----- You chose Group: #{input} ----- " # user sees a list of all parent seeds with an index of 1.
      puts ""
      puts SeedPicker::Seeds.show_parents(input)
      # list_parents = SeedPicker::Seeds.get_letter(input) #input is being pased to the SeedPicker::Seeds.get_letter method where it's being passed into a hash as a key
      # list_parents.collect.with_index(1) do |the_info, index| # the results of the SeedPicker::Seeds.testing(input) method is saved as group variable. The group variable is iterated with index of 1.
      #   puts "  #{index}. #{the_info}"
      # end
      choose_a_parent_seed
    when "EXIT"
      goodbye
    when (1...10) #fix this
      puts "Please enter a letter."
      input = gets.strip.to_s.upcase
    else
      input = gets.strip.to_s.upcase
    end

  end

  def choose_a_parent_seed
    puts ""
    puts "^ - ^ Please choose a seed by its number." # user is prompted with a choice
    input = gets.strip.to_i || input = gets.strip.to_s.upcase   # user inputs the number corresponding to the parent seed they want to view
    index = 1
    case input
    when (1...10)
      puts "testing"
      puts ""
      puts " ----- #{input}: parent name - DESCRIPTION ----- "
      # puts SeedPicker::Seeds.testing(input)
      # puts SeedPicker::Seeds.others
      # puts ""
      # puts " -------- Varieties -------- " # user sees a list of all parent seeds with an index of 1.
      # seed.variety_seed_name.each_with_index(1) {|list, index| puts "#{index}. #{list}" }
      # puts ""
      choose_list_of_variety
    when "EXIT"
      goodbye
    when "BACK"
      choose_a_letter
    else
      input = gets.strip.to_s.upcase
    end

  end

  def choose_list_of_variety
    puts ""
    puts "^ - ^ Please choose a variety by its number."
    input = gets.strip.to_i || input = gets.strip.to_s.upcase

    case input
    when (1..10)
      puts "testing"
      # puts "     -------- Group 'letter' - #{input}: #{seed.parent_seed_name} - #{seed.variety_seed_name} --------" # user sees a list of all parent seeds with an index of 1.
      # puts "     #{seed.variety_seed_description} "
      # puts ""
      # puts "     Price: #{seed.price} "
      # SeedPicker::Seeds.get_variety_desc
      # SeedPicker::Seeds.get_prices
      # puts ""
      # puts ""
      go_back_or_finish
    end

  end

  def go_back_or_finish
    puts ""
    puts "^ _ ^ Type list if you want to choose another seed. Type done if you are done."
    input = gets.strip.to_s.upcase

    case input
    when "LIST"
      list_of_seeds
    else "DONE"
      goodbye
    end
  end

  def goodbye
    puts ""
    puts "^ - ^ Goodbye!!!"
    puts ""
    puts "         ( Thank you for viewing our vegetable seed collection. Seed you again, soon. Have a great day! )"
    puts "          , "
    puts "  (\ /)  , "
    puts "  ( . .)  "
    puts "  c(\")(\") "
    puts ""
  end

end
