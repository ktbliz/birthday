require_relative "./birthday.rb"
require_relative "./famous_birthdays.rb"
require_relative "./birthday_stats.rb"

#require "pry"

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
      
      if birthday_validator(birthday)
        @birth_date = birthday 
      elsif birthday.match(/[01][0-9]\W[0-3][0-9]\W[12][019][0-9]{2}/) 
        puts "The birthday you've entered may not be valid. Please note the Birthday gem only covers birthdays between 1901 and 2018."
      else 
        puts "Please re-enter your birthday in the following format: MM/DD/YYYY"
      end
    end 
  end
  
  def birthday_validator(birthday)
    
    date_array = birthday.split("/")
    month = date_array[0].to_i
    day = date_array[1].to_i
    year = date_array[2].to_i
    months31 = [1, 3, 5, 7, 8, 10, 12]
    
    month > 0 && month <= 12 ? m = true : m = false 
    day > 0 && day <= 31 ? d = true : d = false 
    year >= 1901 && year <= 2018 ? y = true : y = false 
   
    if day == 31
      months31.include?(month) ? test31 = true : test31 = false 
    else 
      test31 = true 
    end 
      
    if month == 2 
      day <= 28 ? feb_test = true : feb_test = false 
    else 
      feb_test = true
    end 
    
    return true if m && d && y && test31 && feb_test
    
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
  
  
  #binding.pry
  
  
  
end 
