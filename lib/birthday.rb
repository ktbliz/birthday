require "pry"

class Birthday 
  
  attr_reader :birthday 
  
  def initialize(birthday)
    @birthday = birthday 
  end 
  
  def birthday_format 
    date_array = self.birthday.split("/")
  end 
  
  def countdown 
    
  end 
    
  binding.pry 

end 