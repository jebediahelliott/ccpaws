class Ccpaws::Scraper

  def self.scrape
    html = open("https://www.meetup.com/find/tech/?allMeetups=false&radius=10&userFreeform=State+College%2C+PA&mcId=c16801&mcName=State+College%2C+PA&sort=default")
    doc = Nokogiri::HTML(html)
    group_cards = []
    cards = doc.css(".groupCard")
    cards.each do |card|
      group_cards << Ccpaws::Group.new({
      name: card.css("h3").text.strip,
      members: card.css("p").text.strip,
      url: card.css("a").attribute("href").value
    })
    end
  end
    # don't scrape for description until user requests a particular group
    # make sure we never scrape twice for the same descrption
    def self.more_info(url)

        doc = Nokogiri::HTML(open(url))
        doc.css(".group-description .chunk p").text



  end
end
