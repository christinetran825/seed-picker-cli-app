class SeedPicker::CLI

  def call
    # SeedPicker::Scraper.new.print_seeds
    puts "Welcome to Baker Creek Heirloom Seeds RareSeeds."
    choose_letter
    choose_parent_seed
    choose_variety
    choose_another_seed
    goodbye
  end

  def choose_letter
    puts ""
    puts "Please choose a seed by its letter. Please enter a letter from A-Z." # user is prompted with a demand
    puts ""
    puts "----- Vegetable Seeds -----"   # user sees a list of vegetable seeds
    puts "A: Amaranth, Artichoke & Cardoon, Asparagus"
    SeedPicker::Scraper.new.print_seeds ## scrape the seeds into groups starting with the seeds' name's first letter
    puts ""

    # user inputs the letter of the parent seed, that letter gives us a list of all the seeds within that letter starting with an index of 1.
    input = gets.strip.to_s.upcase

    case input
    when ("A"..."Z")
      choose_parent_seed
    when "exit"
      goodbye
    else
      input = gets.strip.to_s.upcase
    end

      # if input != ("A"..."Z") # user enters a letter matching the parent seed name.
      #   puts "Please enter a letter."
      #   # input = gets.strip.to_s.upcase
      # elsif input == "exit" # user has option to exit = exits to goodbye
      #   goodbye
      # else
      #   choose_parent_seed # user sees a description of the parent seeds
      # end

  end

  def choose_parent_seed
    puts ""
    puts "Please choose a seed by its number. Type back to go back to the group of seeds. Or type exit to exit." # user is prompted with a choice
    puts ""
    puts "----- Seeds in Group A -----" # user sees a list of all parent seeds with an index of 1.
    puts "1. Amaranth"
    puts "2. Artichoke & Cardoon"
    puts "3. Asparagus"
    puts ""

    # user inputs the number corresponding to the parent seed they want to view

    input = gets.strip.to_i

    case input
    when (1..10)
      choose_variety
    when "exit"
      goodbye
    when "back"
      choose_parent_seed
    else
      input = gets.strip.to_s.upcase
    end

      # if input != (1..10) # user enters a number matching the parent seed name.
      #   puts "Please enter a number."
      #   # input = gets.strip.to_i
      # elsif input == "back"   # user has option to go back = returns to choose_letter
      #   choose_letter
      # elsif input == "exit" # user has option to exit = exits to goodbye
      #   goodbye
      # else
      #   choose_variety # user sees a description of the parent seeds
      # end

  end

  def choose_variety
    puts ""
    puts "Please choose a variety by its number. Type back to go back to the main list of seeds. Or type exit to exit." # user is prompted with a choice
    puts ""
    puts "--- A - 1: Amaranth ---" # user sees a list of all parent seeds with an index of 1.
    puts "1. Aurelia's Verde"
    puts "2. Dreadlocks Amaranth"
    puts "3. Elena's Rojo Amaranth"
    puts ""

    # user inputs the number corresponding to the variety they want to view

    input = gets.strip.to_i

    case input
    when (1..10)
      choose_another_seed
    when "exit"
      goodbye
    when "back"
      choose_variety
    else
      input = gets.strip.to_s.upcase
    end

      # if input != (1..10) # user enters a number matching the parent seed name.
      #   puts "Please enter a number."
      #   # input = gets.strip.to_i
      # elsif input == "back"   # user has option to go back = returns to choose_letter
      #   choose_parent_seed
      # elsif input == "exit" # user has option to exit = exits to goodbye
      #   goodbye
      # else
      #   choose_another_seed # user sees the variety's name, description, and price
      # end

  end

  def choose_another_seed
    # user chooses to view another seed or leave the site
    puts ""
    puts "Do you want to choose another seed? Enter Y or N. Type back to go back to the variety of seeds. " # user is prompted a question
    puts ""

    input = gets.strip.to_s.upcase

    case input
    when "Y"
      choose_letter
    when "N"
      goodbye
    when "back"
      choose_variety
    else
      input = gets.strip.to_s.upcase
    end

      # if input != "N"
      #   choose_letter
      # else
      #   goodbye
      # end

  end

  def goodbye
    puts "Thank you for viewing our vegetable seed collection. We hope to see you again soon. Have a great day!"
  end

end
