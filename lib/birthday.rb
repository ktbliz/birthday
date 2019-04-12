
class Birthday 
  
  attr_reader :birth_date, :month_num, :day, :year, :month_name 
  
  
  def initialize(birth_date)
    @birth_date = birth_date
    birthday_format
  end 
  
  
  def birthday_format 
    
    date_array = self.birth_date.split("/")
    @month_num = date_array[0]
    @day = date_array[1].to_i
    @year = date_array[2]
    
    month_nums = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"] 
    month_names = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    @month_name = month_names[month_nums.index(@month_num)] 
    
  end 
  
  
end 