require_relative "./birthday.rb"
require_relative "./famous_birthdays.rb"
require_relative "./birthday_stats.rb"

class CommandLineInterface 
  
  attr_reader :birth_date, :birthday, :birthday_stats 

  def run 
    welcome
    get_birthday
    create_birthday
    create_birthday_stats
    menu 
  end 
  
  def welcome
    puts "Welcome to the Birthday gem - where it's all about your birthday all the time!"
  end 
  
  def get_birthday 
    puts "When is your birthday? (Enter MM/DD/YYYY)"
    until @birth_date != nil
      birthday = gets.strip
      
      #Need to make this if statement stronger, try regex?
      
      if birthday.length == 10 
        @birth_date = birthday 
      else 
        puts "Please re-enter your birthday in the following format: MM/DD/YYYY"
      end
    end 
  end
  
  def birthday_validator(birthday)
    
  end 
  
  def create_birthday 
    @birthday = Birthday.new(self.birth_date)
  end 
  
  def create_birthday_stats
    @birthday_stats = BirthdayStats.new(create_birthday)
  end 
  
  def menu
    loop do 
      
    puts "What would you like to know about your birthday? Select by entering the number (e.g., 1). Enter 'exit' to exit."
    puts "1. Days until my birthday"
    puts "2. Days that I've been alive"
    input = gets.strip
    puts "Please enter a valid selection." unless input == "1" || input == "2" || input == "exit"
    case input 
      when "1"
        puts @birthday_stats.countdown
      when "2"
        puts @birthday_stats.days_alive 
      when "exit"
        puts "Thank you for visiting and may all your birthday wishes come true!"
        break
     end 
     
    end 
    
  end 
  
  
  
  
  
  
end 
