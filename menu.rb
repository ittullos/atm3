BANK_NAME   = "Tullos Bank"
DENOM_NAMES = {10000=>"Hundreds",5000=>"Fiftys",2000=>"Twentys",1000=>"Tens",
               500=>"Fives",100=>"Ones",50=>"Half Dollars",25=>"Quarters",
               10=>"Dimes",5=>"Nickels",1=>"Pennys"}

class Menu
  attr_reader :menu_selection

  def greeting
    puts "\nWelcome to #{BANK_NAME}" + "\nYou can trust us with your money!"
  end

  def get_name
    print "\nPlease enter your name: "
    gets.chomp
  end

  def invalid_customer
    puts "That name is invalid.. Please try again."
  end

  def main_menu
    puts "\nPlease enter a menu selection: "
    puts "\n1 - Check your balance"
    puts "\n2 - Make a withdrawal"
    puts "\n3 - Make a deposit"
    puts "\n4 - Exit"
    print "\n  => "
    @menu_selection = gets.chomp
  end

  def goodbye
    puts "\nThank you for choosing #{BANK_NAME}! Have a great day!!"
  end

  def withdraw_prompt
    print "\nPlease enter the amount you wish to withdraw: $"
    gets.chomp
  end

  def deposit_prompt
    print "\nPlease enter the amount you wish to deposit: $"
    gets.chomp
  end

  def withdraw_output(amounts)
    puts "\nDispensing cash..."
    amounts.each do |denom, quantity|
      if quantity > 0
        puts "#{DENOM_NAMES[denom]} -> #{quantity}"
      end
    end
  end

  def invalid_menu_selection
    puts "Invalid menu selection. Please try again.."
  end

  def new_account_balance(new_balance)
    puts "\nYour new balance is: $#{new_balance}"
  end

  def show_account_balance(balance)
    puts "\nYour account balance is: $" + balance.to_s
  end

  def insuff_funds
    puts "Insufficient funds. Please try again.."
  end
end
