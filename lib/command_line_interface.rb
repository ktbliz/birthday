class CommandLineInterface 

  def run 
    welcome
    get_birthday
  end 
  
  def welcome
    puts "Welcome to the Birthday gem - where it's all about your birthday all the time!"
  end 
  
  def get_birthday 
    puts "When is your birthday? (Enter MM/DD/YYYY)"
    @birthday = gets.strip
  end 

end 
