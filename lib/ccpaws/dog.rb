class Ccpaws::Dog

  attr_accessor :name, :breed, :age, :weight, :size, :age_range, :sex, :color, :bio, :url
  @@all = []

  def self.all
    @@all
  end

  def initialize(dog_hash)
  dog_hash.each{ |key, value| self.send(("#{key}="), value)}
  @@all << self
end

def self.create_from_collection(dog_array)
  dog_array.each{ |hash| self.new(hash)}
end

def add_student_attributes(attributes_hash)
  attributes_hash.each{ |key, value| self.send(("#{key}="), value)}
  self
end

end
