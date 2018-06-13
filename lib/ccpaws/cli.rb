class Ccpaws::CLI
  def call
    Ccpaws::Scraper.scrape
    list
    menu
    goodbye
  end

  def list
    puts "Welcome! Here are the tech Meetups in the State College area"
    Ccpaws::Group.all.each.with_index(1) do |meetup, i|
      puts "#{i}. #{meetup.name} #{meetup.members}"
    end
  end

  def menu

    input = nil
    while input != "exit"
      puts "Please choose a Meetup to see more information or type exit."
      input = gets.strip.downcase
      if input > 0 && input <= Ccpaws::Group.all.length
        group = Ccpaws::Group.all[input.to_i -1]
        puts "#{group.description}"
        puts "Type list to go back to the menu or type exit."

      end
    end
  end

  def goodbye
    puts "Thanks for checking out our furry friends!"
  end
end
