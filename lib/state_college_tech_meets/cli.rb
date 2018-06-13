class Ccpaws::CLI
  def call
    Ccpaws::Scraper.scrape
    menu
    more_info
    goodbye
  end

  def menu
    puts "Welcome! Here are the tech Meetups in the State College area"
    Ccpaws::Group.all.each.with_index(1) do |meetup, i|
      puts "#{i}. #{meetup.name} #{meetup.members}"
    end
  end

  def more_info

    input = nil
    while input != "exit"
      puts "Please choose a Meetup to see more information, type menu to return to the menu or type exit."
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i <= Ccpaws::Group.all.length
        group = Ccpaws::Group.all[input.to_i - 1]
        puts "#{group.description}"
      elsif input == "menu"
        menu
      elsif input == "exit"
        break
      else
        puts "Invalid entry, please type menu or exit"
      end
    end
  end

  def goodbye
    puts "Have fun with your new friends!!"
  end
end
