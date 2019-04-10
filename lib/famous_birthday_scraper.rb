require_relative "./birthday.rb"
require "pry"
require "nokogiri"
require "open-uri"

class FamousBirthdayScraper
  
  attr_reader :birthday 

  def initialize(birthday_object)
    @birthday = birthday_object if birthday_object.class == Birthday 
    celebrities_scraper
  end
  
  
  def celebrities_scraper
    doc = Nokogiri::HTML(open("https://www.who2.com/born-on/#{self.birthday.month_name}-#{self.birthday.day}/"))
    
    celebrities = doc.css("li.archive-list-item")
    
    name = celebrities.css("h3.entry-title a.u-url")
    year_born = celebrities.css("h3.entry-title span a")
    tagline = celebrities.css("div.entry-summary")
    
    binding.pry
  end

binding.pry

end 