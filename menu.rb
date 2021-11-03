BANK_NAME   = "Tullos Bank"
require './menu_messages'

MESSAGES = {"get_name"=>"\nPlease enter your name: ",
            "how_much"=>"\nPlease enter an amount: $",
            "invalid_customer"=>"\n  ->That name is invalid.. Please try again.",
            "invalid_menu_selection"=>"\n  ->Invalid menu selection. Please try again..",
            "new_account_balance"=>"\n  Your new balance is: $",
            "show_account_balance"=>"\n  Your account balance is: $",
            "insuff_funds"=>"\n  ->Insufficient funds. Please try again.."}

class Menu

  def prompt(keyword, value = "")
    if MESSAGES[keyword]
      print MESSAGES[keyword]
      if value != ''
        puts value
      end
    end
    if keyword == 'display_options'
      puts OPTIONS
      print "   => "
    end
    gets.chomp
  end

  def display(keyword, value = "")
    puts GREETING if keyword == 'greeting'
    puts GOODBYE if keyword == 'goodbye'
    if MESSAGES[keyword]
      print MESSAGES[keyword]
      if value != ''
        puts value
      else
        print "\n"
      end
    end
    if keyword == 'withdraw_output'
      puts "\nDispensing cash..."
      value.each do |denom, quantity|
        puts "  #{denom} -> #{quantity}" if quantity > 0
      end
    end
  end
end
