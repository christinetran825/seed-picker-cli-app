class SeedPicker::CLI

  def call
    SeedPicker::Scraper.new.print_seeds
    puts "Welcome to Baker Creek Heirloom Seeds RareSeeds. \n Here is a collection of our Vegetable seeds:"
    list_seeds
    choose_letter
    choose_parent_seed
    choose_variety
    choose_another_seed
    list_seeds
    goodbye
  end

  def exit

  end

  def list_seeds
    # user sees a list of vegetable seeds
    ## scrape the seeds into groups starting with the seeds' name's first letter
    puts "A: Amaranth, Artichoke & Cardoon, Asparagus"
    puts "B: Beans, Beetroot, Bok Choy, Broccoli, Brussels Sprouts"
    puts "C: Cabbage, Carrots, Cauliflower, Celery & Celeriac, Chicory, Chinese Cabbage, Collards, Corn, Cowpeas, Cucumbers"

  end

  def choose_letter
    # user chooses the parent seed by its grouped letter

    # user is prompted with a choice
    puts "Which group would you like to view? Please enter a letter from A-Z, enter back to go back to the list of seeds, or enter exit to exit."
    # user inputs the letter of the parent seed, that letter gives us a list of all the seeds within that letter starting with an index of 1.
    input = gets.chomp.to_s.upcase

    # build the list
      # user has option to go back = returns to list_seeds
    # user has option to exit = exits to goodbye
    # user sees a list of all parent seeds within the input letter starting with an index of 1.

  end

  def choose_parent_seed
    # user chooses the parent seed within the number/integer input

    # user is prompted with a choice
    puts "Which vegetable seed would you like to view? Please enter a number, enter back to go back to the group of seeds, or enter exit to exit."
    # user inputs the number corresponding to the parent seed they want to view
    input = gets.chomp.to_i

    # build the list
    # user has option to go back = returns to choose_letter
    # user has option to exit = exits to goodbye
    # user sees a description of the parent seeds
    # user sees a list of the varieties grouped by the starting with an index of 1.
  end

  def choose_variety
    # user chooses the variety seed within the number/integer input
    # user is prompted with a choice
    puts "Which variety of {choose_parent_seed_input} would you like to view? Please enter a number, enter back to go back to the group of seeds, or enter exit to exit."
    input = gets.chomp.to_i

    # user inputs the number corresponding to the variety they want to view
    # user has option to go back = returns to choose_parent_seed
    # user has option to exit = exits to goodbye
    # user sees the variety's name, description, and price
  end

  def choose_another_seed
    # user chooses to view another seed or leave the site
    # user is prompted a question
    puts "Do you want to choose another seed? Enter Y or N."
    input = gets.chomp.to_s.upcase
      if input != "N"
        list_seeds
      else
        goodbye
      end
  end

  def goodbye
    puts "Thank you for viewing our vegetable seed collection. We hope to see you again soon. Have a great day!"
  end

end
