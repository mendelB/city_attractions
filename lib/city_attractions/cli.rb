class CityAttractions::CLI 
  def call
    puts 'welcome'
    list_cities
    choose_city
    
  end

  def list_cities
    CityAttractions::Scraper.scrape_cities
    CityAttractions::City.all.each.with_index(1) do |city, index|
      puts "#{index}: #{city.name}"
    end
  end

  def choose_city
      puts "Choose the city number for its top attractions"
      city_choice = nil
      city_choice = gets.strip.downcase
      city = CityAttractions::City.all[city_choice.to_i - 1]
      CityAttractions::Scraper.scrape_attractions(city)
      puts "here are the top attractions for #{city.name}"

  end


end



