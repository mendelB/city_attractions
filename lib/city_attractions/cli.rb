class CityAttractions::CLI 
  def call
    puts 'welcome'
    list_cities
    choose_city
    list_attractions
    
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
      @city_attractions = CityAttractions::Scraper.scrape_attractions(city)
      puts "here are the top attractions for #{city.name}"
      @city_attractions.each_with_index do |attraction,index|
        puts "#{index + 1}. #{attraction.name}"
      end
       puts "choose an attraction for more info"
  end

  def list_attractions
    attraction_choice = nil
    attraction_choice = gets.strip.downcase
    attraction = CityAttractions::Attraction.all[attraction_choice.to_i - 1]
     @attraction_info = CityAttractions::Scraper.scrape_info(attraction)
       @attraction_info.collect do |info|
       puts "#{info}"
       end 
    end
end



