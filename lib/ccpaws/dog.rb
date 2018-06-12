class Ccpaws::Group

  attr_accessor :name, :url, :description
  @@all = []

  def self.all
    @@all
  end

  def initialize(group_hash)
  group_hash.each{ |key, value| self.send(("#{key}="), value)}
  @@all << self
end

def self.create_from_collection(group_array)
  group_array.each{ |hash| self.new(hash)}
end

def add_student_attributes(page_hash)
  page_hash.each{ |key, value| self.send(("#{key}="), value)}
  self
end

end
