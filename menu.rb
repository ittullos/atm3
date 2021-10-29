BANK_NAME   = "Tullos Bank"

class Menu

  def prompt(keyword, value = "")
    print "\nPlease enter your name: " if keyword == 'get_name'
    if keyword == 'display_options'
      puts "\nPlease enter a menu selection: "
      puts "\n  1 - Check your balance"
      puts "\n  2 - Make a withdrawal"
      puts "\n  3 - Make a deposit"
      puts "\n  4 - Exit"
      print "\n   => "
    end
    print "\nPlease enter the amount you wish to #{value}: $" if keyword == 'how_much'
    gets.chomp
  end

  def display(keyword, value = "")
    if keyword == 'greeting'
      puts "\n    Welcome to #{BANK_NAME}" + "\nYou can trust us with your money!"
    elsif keyword == 'withdraw_output'
      puts "\nDispensing cash..."
      value.each do |denom, quantity|
        puts "  #{denom} -> #{quantity}" if quantity > 0
      end
    elsif keyword == 'goodbye'
      puts "\nThank you for choosing #{BANK_NAME}!"
      puts "      Have a great day!"
      print "\n"
    end
    puts "\n  ->That name is invalid.. Please try again." if keyword == 'invalid_customer'
    puts "\n  ->Invalid menu selection. Please try again.." if keyword == 'invalid_menu_selection'
    puts "\n  Your new balance is: $#{value}" if keyword == 'new_account_balance'
    puts "\n  Your account balance is: $#{value}" if keyword == 'show_account_balance'
    puts "\n  ->Insufficient funds. Please try again.." if keyword == 'insuff_funds'
  end
end
