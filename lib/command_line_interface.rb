require_relative "./birthday.rb"
require_relative "./birthday_stats.rb"
require_relative "./famous_birthdays.rb"

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
    puts "Welcome to the Birthday gem - where it's all about your birthday all the time!\n\n"
  end 
  
  
  def get_birthday 
    
    puts "When is your birthday? (Enter MM/DD/YYYY)"
    
    until @birth_date != nil
    
      birth_date = gets.strip
      
      if birth_date_validator(birth_date)
        @birth_date = birth_date 
      elsif birth_date.match(/[01][0-9]\W[0-3][0-9]\W[12][019][0-9]{2}/) 
        puts "The birthday you've entered may not be valid. Please re-enter your birthday in the following format: MM/DD/YYYY. Note that the Birthday gem only covers birthdays between 1901 and 2018."
      else 
        puts "Please re-enter your birthday in the following format: MM/DD/YYYY"
      end
      
    end 
    
  end
  
  
  def birth_date_validator(birth_date)
    
    date_array = birth_date.split("/")
    month = date_array[0].to_i
    day = date_array[1].to_i
    year = date_array[2].to_i
    
    month > 0 && month <= 12 ? m = true : m = false 
    day > 0 && day <= 31 ? d = true : d = false 
    year >= 1901 && year <= 2018 ? y = true : y = false 
    
    months31 = [1, 3, 5, 7, 8, 10, 12]
   
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
    
    puts "\nWhat would you like to know about your birthday? Select by entering the number (for example: '1'). Enter 'exit' to exit.\n\n"
    menu_items
    
    loop do 
      
      input = gets.strip
      
      puts "\n\nPlease enter a valid selection." unless input == "1" || input == "2" || input == "exit"
      
      case input 
        when "1"
          puts "\n#{@birthday_stats.countdown}"
        when "2"
          puts "\n#{@birthday_stats.days_alive}" 
        when "exit"
          puts "\nThank you for visiting and may all your birthday wishes come true!"
          break
       end 
       
       puts "\nWhat else would you like to know about your birthday? Select by entering the number (for example: '1'). Enter 'exit' to exit.\n\n"
       menu_items
       
    end 
    
  end 
  
  
  def menu_items 
    
    puts "1. Days until my birthday"
    puts "2. Days that I've been alive"
    
  end 
  
  
  #binding.pry
  
end 
