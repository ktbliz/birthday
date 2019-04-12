require_relative "./birthday.rb"

class FamousBirthdayScraper
  
  attr_reader :birthday, :celebrities 

  def initialize(birthday_object)
    @birthday = birthday_object if birthday_object.class == Birthday 
    celebrities_scraper
  end
  
  
  def celebrities_scraper
    doc = Nokogiri::HTML(open("https://www.who2.com/born-on/#{self.birthday.month_name}-#{self.birthday.day}/"))
    list = doc.css("li.archive-list-item")
    
    @celebrities = []
    
    list.each { |celebrity|
      celebrity_info = {}
      celebrity_info[:name] = name_formatting(celebrity.css("h3.entry-title a.u-url").text.strip)
      celebrity_info[:year_born] = celebrity.css("h3.entry-title span a").text.strip
      celebrity_info[:tagline] = celebrity.css("div.entry-summary").text.strip
      @celebrities << celebrity_info
    }
    
    @celebrities
  end
  
  
  def name_formatting(raw_name)
    name_array = raw_name.split(",")
    name = "#{name_array[1]} #{name_array[0]}"
  end 


end 