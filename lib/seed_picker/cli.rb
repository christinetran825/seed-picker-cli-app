class SeedPicker::CLI

  def call
    SeedPicker::Scraper.scrape_parent_seeds #CLI calls on the scraper class to tell Nokogiri to scrape the website
    puts ""
    puts "* * * Welcome to Baker Creek Heirloom Seeds RareSeeds * * * "
    puts ""
    start
  end

############ Start of Program ############

  def start
    puts "Here's our collection of vegetable seeds."
    puts ""
    puts "------------- Vegetable Seeds -------------"   # user sees a list of vegetable seeds
    SeedPicker::Seeds.listing_all_seeds
    choose_a_parent_seed
  end

  def choose_a_parent_seed
    puts ""
    puts "^ - ^ Please choose a seed by its number."
    num = gets.strip.to_i || um = gets.strip.to_s
    case num
    when (1..63)
      seed = SeedPicker::Seeds.find(num.to_i) #finding num(user's input) for the seed chosen from choose_a_letter method and NOT from the entire alpha
      SeedPicker::Scraper.scrape_variety_seeds(seed) #calls the Scraper class method .scrape_variety_seeds & passes seed
      puts ""
      puts "----- Group: #{seed.parent_seed_name[0]} - #{seed.parent_seed_name} ----- "
      puts ""
      puts "Varieties: " # user sees a list of all parent seeds with an index of 1.
      puts ""
      SeedPicker::Varieties.get_varieties(seed).compact
      puts ""
      puts "Description: "
      puts ""
      # puts "#{seed.parent_seed_description}"
      SeedPicker::Seeds.find_desc(seed)
      # helper(seed)
      puts ""
      choose_list_of_variety(seed) #seed gets passed to next method
    when "DONE"
      goodbye
    else
      choose_a_parent_seed
    end

  end

  # def helper(seed)
  #   if seed == 23 || 28 #garlic, ground cherries
  #     puts "#{seed.parent_seed_description_b}"
  #   elsif seed == 24 || 34 || 40 || 50 || 54 #gourds, melons, peppers, squash, tomatoes; no descriptions
  #     #there's no description from website
  #     puts "#{seed.parent_seed_description_a}"
  #     puts "Select a variety to view descriptions."
  #   else
  #     puts "#{seed.parent_seed_description_c}" #all seeds and 46 salad blends
  #   end
  # end

  def choose_list_of_variety(seed)
    puts ""
    puts "^ - ^ Please choose a variety by its number."
    num = gets.strip.to_i
    case num
    when (1..63)
      variety = SeedPicker::Varieties.find(num.to_i)
      puts ""
      puts "-------- Group #{seed.parent_seed_name[0]}: #{seed.parent_seed_name} - #{variety.variety_seed_name} --------" # user sees a list of all parent seeds with an index of 1.
      puts ""
      puts "Price: #{variety.price} "
      puts ""
      puts "Description: "
      puts ""
      SeedPicker::Scraper.scrape_variety_details(variety)
      puts "#{variety.variety_seed_description} "
      puts ""
      go_back_or_finish
    when "DONE"
      goodbye
    else
      choose_list_of_variety(seed)
    end

  end

  def go_back_or_finish
    puts ""
    puts "^ _ ^ Type list if you want to choose another seed. Type done if you are done."
    input = gets.strip.to_s.upcase

    case input
    when "LIST"
      start
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
