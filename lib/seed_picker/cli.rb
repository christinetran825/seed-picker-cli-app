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
      seed = SeedPicker::Seeds.find(num.to_i) #finding num(user's choice of seed) from list of all seeds
      SeedPicker::Scraper.scrape_variety_seeds(seed) #calls the Scraper.scrape_variety_seeds & passes the user's seed. That seed's details are scraped in that method
      SeedPicker::Scraper.scrape_parent_seeds_descriptions(seed) #calls the Scraper.scrape_parent_seeds_description & passes the user's seed. That seed's details are scraped in that method
        puts ""
        puts "----- Group: #{seed.parent_seed_name[0]} - #{seed.parent_seed_name} ----- "
        puts ""
        puts "Varieties: " # user sees a list of all parent seeds with an index of 1.
        puts ""
        SeedPicker::Varieties.get_varieties(seed).compact
        puts ""
        puts "Description: "
        puts ""
        puts "#{seed.parent_seed_description}"
        puts ""
      choose_specs(seed)
      # choose_list_of_variety(seed) #seed gets passed to next method
    when "DONE"
      goodbye
    else
      choose_a_parent_seed
    end
  end

  def choose_specs(seed)
    case seed.parent_seed_name
    when "Gourds" || "Melon" || "Peppers" || "Squash" || "Tomatoes"
      choose_grouped_variety(seed)
    else
      choose_list_of_variety(seed)
    end
  end

  def choose_grouped_variety(seed)
    puts "   ~ ~ ~ Please choose the grouped variety. ~ ~ ~"
    num = gets.strip.to_i
    case num
    when (1..63)
      groups = SeedPicker::Grouped_Variety.find(num.to_i)
      variety = SeedPicker::Varieties.find(num.to_i)
      SeedPicker::Scraper.scrape_grouped_varieties(groups)
        puts ""
        puts "   -------- Group #{seed.parent_seed_name[0]}: #{seed.parent_seed_name} - #{variety.variety_seed_name} --------"
        puts "   #{variety.variety_seed_name} - Varieties: "
        puts ""
        SeedPicker::Grouped_Variety.get_grouped_variety(groups)
        puts ""
        puts "Main Description: "
        puts "   #{groups.grouped_variety_description}"
        puts ""
        puts "Price:"
        puts ""
        puts "Variety Description"
        # SeedPicker::Scraper.scrape_grouped_varieties_details(groups)
        # puts "   #{groups.grouped_variety_varieties_description}"
        puts ""
    else
      puts "testing"
    end
  end


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
        puts "Variety Description: "
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
