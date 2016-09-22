class CityAttractions::City
  attr_accessor :name, :url, :attractions
  @@all = []
  def initialize(name, url)
    @name = name
    @url = url
    @attractions = [] 
    @@all << self
  end

  def self.all
    @@all
  end

end