require_relative "./birthday.rb"
require "open-uri"
require "nokogiri"
require "pry"

class BirthdayStats
  
  attr_reader :birthday 
  
  def initialize(birthday_object)
    @birthday = birthday_object if birthday_object.class == Birthday 
  end
  
  def stats_scraper 
    doc = Nokogiri::HTML(open("https://mybirthday.ninja/?m=#{self.birthday.month_name}&d=#{self.birthday.day}&y=#{self.birthday.year}&go=Go"))  
  
    summary = doc.css("ul.summary")  
     
  end 
  
binding.pry 
  
end 