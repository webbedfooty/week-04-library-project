require "pry"
require "sinatra"
require "sinatra/activerecord"
require "sinatra/reloader"

require_relative "lib/book.rb"
require_relative "lib/library.rb"
require_relative "lib/patron.rb"
require_relative "lib/staff_member.rb"

binding.pry

# Main Menu
def main_menu
  choice = ""

  while choice != "exit"
    puts "\nWelcome to Eratos"
    puts "\nMain Menu Options:"
    puts "Type L to see the Library Menu"
    puts "Type B to see the Book Menu"
    puts "Type S to see the Staff Menu"
    puts "Type P to see the Patron Menu"
    puts "Exit: Exit"
    print "\nWhat is your choice? "
    choice = gets.chomp.downcase

    while choice != "l" && choice != "b" && choice != "s" &&
       choice != "p" && choice != "exit"
        print "Sorry, that's an invalid choice."
        print "Please try again: "
       choice = gets.chomp.downcase
    end

    if choice == "l"
      puts "Heading to the Library menu"
      puts "= = = = = = = = = = = = = ="
      library_menu # method call
      puts "= = = = = = = = = = = = = ="
    elsif choice == "b"
      puts "Heading to the Book menu"
      puts "= = = = = = = = = = = = = ="
      book_menu # method call
      puts "= = = = = = = = = = = = = ="
    elsif choice == "s"
      puts "Heading to the Staff menu"
      puts "= = = = = = = = = = = = = ="
      employee_menu # method call
    elsif choice == "p"
      puts "Heading to the Patron menu"
      puts "= = = = = = = = = = = = = ="
      patron_menu # method call
    elsif choice == "exit"
      puts "You chose to leave - goodbye!"
      puts "= = = = = = = = = = = = = ="
    end
  end
end
####################################
