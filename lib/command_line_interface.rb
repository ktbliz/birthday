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
    until @birthday != nil
      birthday = gets.strip
      
      #Need to make this if statement strong, try regex?
      
      if birthday.length == 10 
        @birthday = birthday 
      else 
        puts "Please re-enter your birthday in the following format: MM/DD/YYYY"
      end
    end 
  end
  
end 
