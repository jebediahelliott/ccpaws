class Ccpaws::Scraper

  def self.scrape_index_page
    html = open("https://www.meetup.com/find/tech/?allMeetups=false&radius=10&userFreeform=State+College%2C+PA&mcId=c16801&mcName=State+College%2C+PA&sort=default")
    doc = Nokogiri::HTML(html)
    group_cards = []
    cards = doc.css(".groupCard")
    cards.each do |card|
      group_cards << Ccpaws::Group.newI({
      nane: card.css("h3").text.strip,
      members: card.css("p").text.strip,
      url: card.css("a").attribute("href").value
    })
    binding.pry
    end

    group_cards.each do |card|
      html = open(card.url)
      doc = Nokogiri::HTML(html)
      card.description = doc.css(".group-description .chunk p")
    end
  end
end
