class SeedPicker::CLI

  def call
    SeedPicker::Scraper.scrape_parent_seeds #CLI calls on the scraper class to tell Nokogiri to scrape the website
    puts "* * * Welcome to Baker Creek Heirloom Seeds RareSeeds * * * "
    puts ""
    list_of_seeds
  end

  def list_of_seeds
    puts "Here's our collection of vegetable seeds."
    puts ""
    puts "  ------------- Vegetable Seeds -------------"   # user sees a list of vegetable seeds
    SeedPicker::Seeds.show_all_seeds_by_letter
    choose_a_letter
  end

  def choose_a_letter
    puts ""
    puts "^ - ^ Please choose a group of seeds by its letter from A-Z for more details." # user is prompted with a demand
    puts ""
    input = gets.strip.to_s.upcase || input = gets.strip.to_i
    main = SeedPicker::Seeds.show_all_seeds_by_letter ## Seeds class veggie_seed method
    puts ""

    case input
    when ("A"..."Z")
      puts ""
      puts " ----- You chose Group: #{input} ----- " # user sees a list of all parent seeds with an index of 1.
        main[input].collect.with_index(1) do |seed, index|
          puts "#{index}. #{seed}"
        end
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

    case input
    when (1..10)
      puts " ----- Group 'letter' - #{input}: 'name of seed' ----- "
      puts "     Description of seed"
      # SeedPicker::Seeds.get_description
      puts ""
      puts " ----- 'name of seed' - Varieties --------" # user sees a list of all parent seeds with an index of 1.
      # puts "     1. Aurelia's Verde"
      # puts "     2. Dreadlocks Amaranth"
      # puts "     3. Elena's Rojo Amaranth"
      puts ""
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
      puts "     -------- Group 'letter' - #{input}: 'name of seed' - 'variety_name' --------" # user sees a list of all parent seeds with an index of 1.
      puts "     Variety Description: "

      puts "     Price: "
      go_back_or_finish
    end

  end

  def go_back_or_finish
    puts ""
    puts "~.~ Type list if you want to choose another seed. Type done if you are done."
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
    puts "^ - ^ Thank you for viewing our vegetable seed collection. We hope to see you again soon. Have a great day!"
    #draw tomato or carrot or rabbit :]
  end

end
