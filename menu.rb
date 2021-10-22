BANK_NAME = "Tullos Bank"

class Menu
  attr_reader :name_input, :menu_selection

  def greeting
    puts "\nWelcome to #{BANK_NAME}" + "\nYou can trust us with your money!"
  end

  def get_name
    print "\nPlease enter your name: "
    @name_input = gets.chomp
  end

  def reprimand_customer
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

  def withdraw_output(bills, coins, bill_names, coin_names)
    puts "\nDispensing cash..."
    bills.each do |denom, quantity|
      if quantity > 0
        puts "#{bill_names[denom]} -> #{quantity}"
      end
    end
    puts "\nDispensing coins..."
    coins.each do |denom, quantity|
      if quantity > 0
        puts "#{coin_names[denom]} -> #{quantity}"
      end
    end
  end
end
