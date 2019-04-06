require_relative "./birthday.rb"
require "open-uri"
require "nokogiri"
require "pry"

class BirthdayStats
  
  attr_reader :birthday, :countdown, :turning, :days_alive, :zodiac_sign, :chinese_zodiac, :birthstone 
  
  def initialize(birthday_object)
    @birthday = birthday_object if birthday_object.class == Birthday 
    stats_scraper
  end
  
  def stats_scraper 
    doc = Nokogiri::HTML(open("https://mybirthday.ninja/?m=#{self.birthday.month_name}&d=#{self.birthday.day}&y=#{self.birthday.year}&go=Go"))  
  
    stats_list = doc.css("ul.summary li").text 
    @countdown = stats_list[8]
    @turning = stats_list[9]
    @days_alive = stats_list[10]
    @zodiac_sign = stats_list[19]
    @chinese_zodiac = stats_list[24]
    @birthstone = stats_list [26]
     
  end 
  
#binding.pry 
  
end 