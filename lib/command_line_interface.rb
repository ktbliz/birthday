require_relative "./birthday.rb"
require_relative "./birthday_stats_scraper.rb"
require_relative "./famous_birthday_scraper.rb"

class CommandLineInterface 
  
  attr_reader :birth_date, :birthday, :birthday_stats_scraper, :famous_birthday_scraper 


  def run 
    welcome
    get_birthday
    create_birthday
    create_birthday_stats_scraper
    create_famous_birthday_scraper
    menu 
  end 
  
  
  def welcome
    puts "Welcome to the Birthday gem - where it's all about your birthday all the time!"
    puts "When is your birthday? (Enter MM/DD/YYYY)"
  end 
  
  
  def get_birthday 
    
    until @birth_date != nil
    
      birth_date = gets.strip
      
      if birth_date_validator(birth_date) && birth_date.match(/\A[01][0-9]\W[0-3][0-9]\W[12][0-9]{3}\z/) 
        @birth_date = birth_date 
      elsif birth_date.match(/\A[01][0-9]\W[0-3][0-9]\W[12][0-9]{3}\z/) 
        puts "The birthday you've entered may not be valid. Note that the Birthday gem only covers birthdays between 1901 and 2018.  Please re-enter your birthday in the following format: MM/DD/YYYY."
      else 
        puts "Please re-enter your birthday in the following format: MM/DD/YYYY"
      end
      
    end 
    
  end
  
  
  #The birth_date_validator makes sure the entered birthday follows the MM/DD/YYYY format, is a valid birthday, and falls within the accepted range (1901 to 2018)
  
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
  
  
  def create_birthday_stats_scraper
    @birthday_stats_scraper = BirthdayStatsScraper.new(create_birthday)
    @birthday_stats_scraper.tap { |x| x.stats_scraper }
  end 
  
  def create_famous_birthday_scraper
    @famous_birthday_scraper = FamousBirthdayScraper.new(create_birthday)
    @famous_birthday_scraper.tap { |x| x.celebrities_scraper }
  end 
  
  
  def menu
    
    puts "\nWhat would you like to know about your birthday? (Enter the number, ex: 1)"
    menu_items
    
    loop do 
      
      input = gets.strip
      
      menu_selections = ["1", "2", "3", "4", "5", "6", "7", "8"]
      
      unless menu_selections.include?(input)
        puts "\n\nPlease enter a valid selection. (Enter the number, ex: 1)"
        menu_items
      end 
      
      case input 
        when "1"
          puts "\n#{@birthday_stats_scraper.countdown}".colorize(:light_blue)
        when "2"
          puts "\n#{@birthday_stats_scraper.days_alive}".colorize(:light_blue)
        when "3"
          puts "\n#{@birthday_stats_scraper.birthstone}".colorize(:light_blue) 
        when "4"
          puts "\n#{@birthday_stats_scraper.zodiac_sign}".colorize(:light_blue) 
        when "5"
          puts "\n#{@birthday_stats_scraper.chinese_zodiac}".colorize(:light_blue) 
        when "6"
          famous_birthdays
        when "7"
          @birth_date = nil 
          puts "\nPlease enter another birthday (MM/DD/YYYY)"
          get_birthday
          create_birthday
          create_birthday_stats_scraper
          create_famous_birthday_scraper
        when "8"
          puts "\nThank you for visiting and may all your birthday wishes come true!"
          break
       end 
       
       if menu_selections.include?(input)
         puts "\nWhat else would you like to know about your birthday? (Enter the number, ex: 1)" unless input == "7"
         puts "\nWhat would you like to know about your birthday? (Enter the number, ex: 1)" if input == "7"
         menu_items
       end       
       
    end 
    
  end 
  
  
  def menu_items 
    puts "1. Days until my next birthday"
    puts "2. Days that I've been alive"
    puts "3. My birthstone"
    puts "4. My Western zodiac sign"
    puts "5. My Eastern zodiac animal"
    puts "6. Famous people who share my birthday"
    puts "7. Choose another birthday!"
    puts "8. Exit"
  end 
  
  def famous_birthdays
    @famous_birthday_scraper.celebrities.each do |celebrity|
      puts "#{celebrity[:name]} (#{celebrity[:year_born]}), #{celebrity[:tagline]}".colorize(:light_blue)
    end 
  end 
  
  
end 
