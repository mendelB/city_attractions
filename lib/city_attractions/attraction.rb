class CityAttractions::Attraction
  attr_accessor :name, :url, :city

  @@attractions = []

  def initialize(name, url)
  	@name = name
  	@url = url
  	save
  end

  def self.all
  	@@attractions
  end

  def save
  	@@attractions << self
  end


end