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
    
    list = doc.css("li.archive-list-item")
    
    celebrities = []
    
    list.each { |celebrity|
      celebrity_info = {}
      celebrity_info[:name] = celebrity.css("h3.entry-title a.u-url").text.strip
      celebrity_info[:year_born] = celebrity.css("h3.entry-title span a").text.strip
      celebrity_info[:tagline] = celebrity.css("div.entry-summary").text.strip
      celebrities << celebrity_info
    }
    
    celebrities
    
    binding.pry
  end

binding.pry

end 