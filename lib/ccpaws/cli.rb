class Ccpaws::CLI
  def call
    Ccpaws::Scraper.scrape
    list
    # menu
  end

  def list
    puts "Welcome! Here are the tech Meetups in the State college area"
    Ccpaws::Group.all.each_with_index do |meetup, i|
      puts "#{i + 1}. #{meetup.name} #{meetup.members}"
    end
  end

  # def menu
  #
  #   input = nil
  #   while input != "exit"
  #     puts "Please choose a dogs number to see more information. Type list to return to list or type exit."
  #     input = gets.strip.downcase
  #     case input
  #     when "1"
  #       puts "Ballpark Frank..."
  #     when "2"
  #       puts "Beaufort..."
  #     when "3"
  #       puts "Brandi..."
  #     when "list"
  #       list
  #     end
  #   end
  #   goodbye
  # end
  #
  # def goodbye
  #   puts "Thanks for checking out our furry friends!"
  # end
end
