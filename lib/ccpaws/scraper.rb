class Ccpaws::Scraper

  def self.scrape_index_page
    html = open("https://www.meetup.com/find/tech/?allMeetups=false&radius=10&userFreeform=State+College%2C+PA&mcId=c16801&mcName=State+College%2C+PA&sort=default")
    doc = Nokogiri::HTML(html)
    group_cards = []
    list = doc.css(".groupCard")
    list.each do |card|
      group_cards << {
      nane: card.css("h3").text.strip,
      members: card.css("p").text.strip,
      url: card.css("a").attribute("href").value
    }
    binding.pry
    end
    


  end

  def self.scrape_profile_page(profile_url)
    html = open(profile_url)
    doc = Nokogiri::HTML(html)
    desc = doc.css(".group-description .chunk p")
    profile_hash = {}

  end
end
