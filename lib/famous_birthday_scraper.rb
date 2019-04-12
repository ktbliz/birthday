require_relative "./birthday.rb"

class FamousBirthdayScraper
  
  attr_reader :birthday, :celebrities 

  def initialize(birthday_object)
    @birthday = birthday_object if birthday_object.class == Birthday 
  end
  
  
  #The celebrities_scraper method scrapes who2.com to create an array of hashes, each containing info on one celebrity that shares the given birthday
  
  def celebrities_scraper
    doc = Nokogiri::HTML(open("https://www.who2.com/born-on/#{self.birthday.month_name}-#{self.birthday.day}/"))
    list = doc.css("li.archive-list-item")
    
    @celebrities = []
    
    list.each { |person|
      person_info = {}
      person_info[:name] = name_formatting(person.css("h3.entry-title a.u-url").text.strip)
      person_info[:year_born] = person.css("h3.entry-title span a").text.strip
      person_info[:tagline] = person.css("div.entry-summary").text.strip
      @celebrities << person_info
    }
    
    @celebrities
  end
  
  
  #The name_formatting method re-formats the scraped celebrity names (switches the order of first and last names), and is used by the celebrity_scraper method
  
  def name_formatting(raw_name)
    name_array = raw_name.split(",")
    name = "#{name_array[1]} #{name_array[0]}"
  end 


end 