class CityAttractions::CLI 
  def call
    puts 'welcome'
    list_cities
  end

  def list_cities
    CityAttractions::Scraper.scrape_cities
    CityAttractions::City.all.each.with_index(1) do |city, index|
      puts "#{index}: #{city.name}"
    end
  end

end