class CityAttractions::Scraper
  BASE = "http://www.aviewoncities.com/_attractions.htm"
  def self.scrape_cities
    doc = Nokogiri::HTML(open("http://www.aviewoncities.com/_attractions.htm"))
    td_tags = doc.search('#indexdata tr')[1].search('td')[2..4]

    td_tags.each_with_index do |td, index|
      next if index == 1
      city_divs = td.search(".indexBox")
      city_divs.each do |city_div|
        a_tag = city_div.search("h2 a")
        url = a_tag.attr('href').value
        name = a_tag.text
        CityAttractions::City.new(name, url)
      end
    end
  end
end