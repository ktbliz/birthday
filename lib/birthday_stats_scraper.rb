require_relative "./birthday.rb"

class BirthdayStatsScraper
  
  attr_reader :birthday, :countdown, :turning, :days_alive, :zodiac_sign, :chinese_zodiac, :birthstone 
  
  def initialize(birthday_object)
    @birthday = birthday_object if birthday_object.class == Birthday 
  end
  
  
  def stats_scraper 
    doc = Nokogiri::HTML(open("https://mybirthday.ninja/?m=#{self.birthday.month_name}&d=#{self.birthday.day}&y=#{self.birthday.year}&go=Go"))  
    stats_list = doc.css("ul.summary li") 
  
    @countdown = stats_list[8].text
    @turning = stats_list[9].text
    @days_alive = stats_list[10].text 
    @zodiac_sign = stats_list[19].text
    @chinese_zodiac = stats_list[24].text
    @birthstone = stats_list [26].text 
  end 

  
end 