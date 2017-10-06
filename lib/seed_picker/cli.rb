class SeedPicker::CLI

  def call
    SeedPicker::Scraper.scrape_parent_seeds #CLI calls on the scraper class to tell Nokogiri to scrape the website
    SeedPicker::Scraper.scrape_group_seeds
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
    puts SeedPicker::Seeds.listing_all_seeds
    choose_a_parent_seed
  end

  def choose_a_parent_seed
    puts ""
    puts "^ - ^ Please choose a seed by its number."
    num = gets.strip.to_i || um = gets.strip.to_s
    case num
    when (1..56)
      seed = SeedPicker::Seeds.find(num.to_i) #finding num(user's choice of seed) from list of all seeds
      SeedPicker::Scraper.scrape_variety_seeds(seed) #calls the Scraper.scrape_variety_seeds & passes the user's seed. That seed's details are scraped in that method
      SeedPicker::Scraper.scrape_parent_seeds_descriptions(seed) #calls the Scraper.scrape_parent_seeds_description & passes the user's seed. That seed's details are scraped in that method
        puts ""
        puts "----- Group: #{seed.parent_seed_name[0]} - #{seed.parent_seed_name} ----- "
        puts ""
        puts "Varieties: " # user sees a list of all parent seeds with an index of 1.
        puts ""
        puts SeedPicker::Varieties.get_varieties(seed).compact
        puts ""
        puts "Description: "
        puts ""
        puts "#{seed.parent_seed_description}"
        puts ""
      choose_specs(seed) #sorting Gourds, Melon, Peppers, Squash, Tomatoes out of the normal program loop 
      # choose_list_of_variety(seed) #seed gets passed to next method
    when "DONE"
      goodbye
    else
      choose_a_parent_seed
    end
  end

  ####### separates the parent seeds with consistent structures from seeds with inconsistent HTML formats #######
  def choose_specs(seed)
    case seed.parent_seed_name
    when "Gourds"
      choose_category(seed)
    when "Melon"
      choose_category(seed)
    when "Peppers"
      choose_category(seed)
    when "Squash"
      choose_category(seed)
    when "Tomatoes"
      choose_category(seed)
    else
      choose_list_of_variety(seed)
    end
  end

  ####### Seeds with inconsistent HTML formats - Gourds, Melon, Peppers, Squash, Tomatoes #######
  def choose_category(seed)
    puts "   ~ ~ ~ Please choose the category of varieties ~ ~ ~"
    num = gets.strip.to_i
    case num
    when (1..56)
      group = SeedPicker::Grouped_Variety.find(num.to_i)
      # binding.pry
      variety = SeedPicker::Varieties.find(num.to_i)
      SeedPicker::Scraper.scrape_grouped_varieties(group)
      seed_name_link = seed.parent_seed_name.downcase
        puts ""
        puts "   -------- Group #{seed.parent_seed_name[0]}: #{seed.parent_seed_name} - #{variety.variety_seed_name} --------"
        puts "   #{variety.variety_seed_name} - Varieties: "
        puts ""
        puts SeedPicker::Grouped_Variety.get_grouped_variety(seed).compact
        puts ""
        puts "Main Description: "
        puts "   #{group.grouped_variety_description}"
        puts ""
      choose_cateogry_varieties(seed, group)
    else
      choose_category(seed)
    end
  end

  ####### Seeds with inconsistent HTML formats - Gourds, Melon, Peppers, Squash, Tomatoes #######
  def choose_cateogry_varieties(seed, group)
    puts ""
    puts "   ~ ~ ~ Please choose the category's varieties ~ ~ ~"
    num = gets.strip.to_i
    case num
    when (1..56)
      SeedPicker::Scraper.scrape_grouped_varieties_details(group)
        puts ""
        puts "Price: #{group.grouped_price}" 
        puts ""
        puts "Variety Description:"
        puts "   #{group.grouped_variety_description}"
        puts ""
      go_back_or_finish
    else
      choose_cateogry_varieties(seed, group)
    end
  end
  
  ##### Normal consistent structure #####
  def choose_list_of_variety(seed)
    puts ""
    puts "^ - ^ Please choose a variety by its number."
    num = gets.strip.to_i
    case num
    when (1..56)
      variety = SeedPicker::Varieties.find(num.to_i)
        puts ""
        puts "-------- Group #{seed.parent_seed_name[0]}: #{seed.parent_seed_name} - #{variety.variety_seed_name} --------" # user sees a list of all parent seeds with an index of 1.
        puts ""
        puts "Price: #{variety.price} "
        puts ""
        puts "Variety Description: "
        puts ""
        SeedPicker::Scraper.scrape_variety_details(variety)
        puts "#{variety.variety_seed_description} "
        puts ""
      go_back_or_finish
    else
      choose_list_of_variety(seed)
    end
  end

  ##### For ALL seeds #####
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
