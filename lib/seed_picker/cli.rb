class SeedPicker::CLI

  def call
    SeedPicker::Scraper.scrape_parent_seeds #CLI calls on the scraper class to tell Nokogiri to scrape the website
    # binding.pry
    # all_seeds = SeedPicker::Seeds.all.clone
    # all_seeds.each do |seeds|
    #   SeedPicker::Scraper.scrape_variety_seeds(seeds)
    #   SeedPicker::Scraper.scrape_variety_details(seeds)
    # end
    puts ""
    puts "* * * Welcome to Baker Creek Heirloom Seeds RareSeeds * * * "
    puts ""
    start
  end

  def all_seeds
    SeedPicker::Seeds.all
  end

  ############ helper methods? #######

  def print_parent_seeds(letter)
    puts ""
    puts " ----- You chose Group: #{letter} ----- " # user sees a list of all parent seeds with an index of 1.
    puts ""
    puts SeedPicker::Seeds.show_parents(letter)
  end

# def print_parent_details(seed)
  # puts ""
  # puts " ----- Group: letter - #{parent_name.upcase} ----- "
  # puts ""
  # puts " -------- Varieties -------- " # user sees a list of all parent seeds with an index of 1.
  # puts ""
  # # 1. seed.variety_seed_name[0]    2. seed.variety_seed_name[1]     3. seed.variety_seed_name[2]    4. seed.variety_seed_name[3]
  # # 5. seed.variety_seed_name[4]     6. seed.variety_seed_name[5]     7. seed.variety_seed_name[6]    8. seed.variety_seed_name[7]
  # # 9. seed.variety_seed_name[8]     10. seed.variety_seed_name[9]
  # puts ""
  # puts " -------- Description -------- "
  # puts ""
  # # puts seed.description
  # puts ""
# end

# def print_variety_details(seed)
  # puts "-------- Group #{letter}: #{seed.parent_seed_name} - #{seed.variety_seed_name} --------" # user sees a list of all parent seeds with an index of 1.
  # puts ""
  # puts "Price: #{seed.price} "
  # puts ""
  # puts "#{seed.variety_seed_description} "
  # puts ""
  #end

  def start
    puts "Here's our collection of vegetable seeds."
    puts ""
    puts "  ------------- Vegetable Seeds -------------"   # user sees a list of vegetable seeds
    SeedPicker::Seeds.listing_all_seeds
    choose_a_letter
  end

  def choose_a_letter
    puts ""
    puts "^ - ^ Please choose a group of seeds by its letter from A-Z." # user is prompted with a demand
    puts ""
    letter = gets.strip.to_s.upcase

    case letter
    when ("A".."Z")
      # puts ""
      # puts " ----- You chose Group: #{input} ----- " # user sees a list of all parent seeds with an index of 1.
      # puts ""
      # puts SeedPicker::Seeds.show_parents(input)
      print_parent_seeds(letter)
      choose_a_parent_seed
    when "DONE"
      goodbye
    else
      choose_a_letter
    end

  end

  def choose_a_parent_seed
    puts ""
    puts "^ - ^ Please choose a seed by its number." # user is prompted with a choice
    input = gets.strip.to_s.upcase
    num = gets.strip.to_i

    case input
    when ("A".."Z") #(1..10)
      parent_name = SeedPicker::Seeds.get_descriptions(input, num)
      puts "testing"
      puts ""
      puts " ----- Group: #{input} - #{parent_name.upcase} ----- "
      puts ""
      puts " -------- Varieties -------- " # user sees a list of all parent seeds with an index of 1.
      # puts SeedPicker::Seeds.others(input)
      # 1. seed    2. seed    3. seed   4. seed
      # 5. seed    6. seed    7. seed   8. seed
      # 9. seed    10. seed
      puts ""
      puts " -------- Description -------- "
      puts ""
      # puts seed.description
      puts ""

      # seed = SeedPicker::Seeds.find(input.to_i)
      # print_parent_details(seed)

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
