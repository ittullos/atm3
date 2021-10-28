BANK_NAME   = "Tullos Bank"
DENOM_NAMES = {10000=>"Hundreds",5000=>"Fiftys",2000=>"Twentys",1000=>"Tens",
               500=>"Fives",100=>"Ones",50=>"Half Dollars",25=>"Quarters",
               10=>"Dimes",5=>"Nickels",1=>"Pennys"}

class Menu

  def greeting
    puts "\n    Welcome to #{BANK_NAME}" + "\nYou can trust us with your money!"
  end

  def get_name
    print "\nPlease enter your name: "
    gets.chomp
  end

  def invalid_customer
    puts "\n  ->That name is invalid.. Please try again."
  end

  def display_options
    puts "\nPlease enter a menu selection: "
    puts "\n  'balance' - Check your balance"
    puts "\n  'withdraw' - Make a withdrawal"
    puts "\n  'deposit' - Make a deposit"
    puts "\n  'exit' - Exit"
    print "\n   => "
    gets.chomp
  end

  def how_much(request)
    print "\nPlease enter the amount you wish to #{request}: $"
    gets.chomp
  end

  def withdraw_output(amounts)
    puts "\nDispensing cash..."
    amounts.each do |denom, quantity|
      if quantity > 0
        puts "  #{DENOM_NAMES[denom]} -> #{quantity}"
      end
    end
  end

  def invalid_menu_selection
    puts "\n  ->Invalid menu selection. Please try again.."
  end

  def new_account_balance(new_balance)
    puts "\n  Your new balance is: $#{new_balance}"
  end

  def show_account_balance(balance)
    puts "\n  Your account balance is: $#{balance}"
  end

  def insuff_funds
    puts "\n  ->Insufficient funds. Please try again.."
  end

  def goodbye
    puts "\nThank you for choosing #{BANK_NAME}!"
    puts "      Have a great day!"
    print "\n"
  end
end
