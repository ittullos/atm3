BANK_NAME   = "Tullos Bank"
require './options'
require './goodbye'
require './greeting'

class Menu

  def prompt(keyword, value = "")
    messages = {"get_name"=>"\nPlease enter your name: ",
                "how_much"=>"\nPlease enter the amount you wish to #{value}: $"}
    print messages[keyword] if messages[keyword]
    if keyword == 'display_options'
      puts OPTIONS
      print "   => "
    end
    gets.chomp
  end

  def display(keyword, value = "")
    messages = {"invalid_customer"=>"\n  ->That name is invalid.. Please try again.",
                "invalid_menu_selection"=>"\n  ->Invalid menu selection. Please try again..",
                "new_account_balance"=>"\n  Your new balance is: $#{value}",
                "show_account_balance"=>"\n  Your account balance is: $#{value}",
                "insuff_funds"=>"\n  ->Insufficient funds. Please try again.."}
    puts GREETING if keyword == 'greeting'
    puts GOODBYE if keyword == 'goodbye'
    puts messages[keyword] if messages[keyword]
    if keyword == 'withdraw_output'
      puts "\nDispensing cash..."
      value.each do |denom, quantity|
        puts "  #{denom} -> #{quantity}" if quantity > 0
      end
    end
  end
end
