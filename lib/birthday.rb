require "pry"

class Birthday 
  
  attr_reader :birthday 
  
  def initialize(birthday)
    @birthday = birthday 
  end 
  
  def birthday_format 
    date_array = self.birthday.split("/")
    month_num = date_array[0]
    day = date_array[1]
    year = date_array[2]
    
    month_nums = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"] 
    month_names = ["January", "February", "March", "April", "May", "June", "July", "August", "Septemer", "October", "November", "December"]
    
  end 
  
  def countdown 
    
  end 
    
  binding.pry 

end 