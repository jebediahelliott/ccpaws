class Ccpaws::Group

  attr_accessor :name, :url, :description, :members
  @@all = []

  def self.all
    @@all
  end

  def initialize(group_hash)
  group_hash.each{ |key, value| self.send(("#{key}="), value)}
  @@all << self
  end

end
