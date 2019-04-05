require_relative "./birthday.rb"
require_relative "./famous_birthdays.rb"

class CommandLineInterface 
  
  attr_reader :birthday 

  def run 
    welcome
    get_birthday
    create_birthday
  end 
  
  def welcome
    puts "Welcome to the Birthday gem - where it's all about your birthday all the time!"
  end 
  
  def get_birthday 
    puts "When is your birthday? (Enter MM/DD/YYYY)"
    until @birthday != nil
      birthday = gets.strip
      
      #Need to make this if statement stronger, try regex?
      
      if birthday.length == 10 
        @birthday = birthday 
      else 
        puts "Please re-enter your birthday in the following format: MM/DD/YYYY"
      end
    end 
  end
  
  def create_birthday 
    Birthday.new(self.birthday)
  end 
  
  
  
end 
