require "./bank_data.rb"

class Teller

  def initialize(menu)
    @bank_data = BankData.new(menu.name_input)
    @menu = menu
  end

  def customer_valid?
    puts "customer_name :#{customer_name}"
    bank_data.is_valid?(customer_name)
  end

  def set_name
    @customer_name = menu.get_name
  end

  def show_balance
    menu.show_account_balance(bank_data.balance(customer_name))
  end

  def make_deposit
    amount = menu.deposit_prompt
    new_balance = bank_data.deposit_funds(amount,customer_name).round(2)
    menu.new_account_balance(new_balance)
    bank_data.write_new_balance(new_balance,customer_name)
  end

  def make_withdrawal
    amount = menu.withdraw_prompt
    if bank_data.balance(customer_name).to_f > amount.to_f
      new_balance = bank_data.withdraw_funds(amount, customer_name).round(2)
      menu.withdraw_output(bank_data.get_dispenser_output)
      menu.new_account_balance(new_balance)
      bank_data.write_new_balance(new_balance, customer_name)
    else
      menu.insuff_funds
    end
  end

  private
  attr_accessor :bank_data, :menu, :customer_name

end
