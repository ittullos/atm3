require "./bank_data.rb"

class Teller

  def initialize(menu)
    @menu = menu
  end

  def customer_valid?
    balance
  end

  def customer_setup
    @name = menu.get_name
    @bank_data = BankData.new(name)
    @balance = bank_data.balance(name)
  end

  def show_balance
    menu.show_account_balance(bank_data.balance(name))
  end

  def make_deposit
    amount = menu.deposit_prompt
    new_balance = bank_data.deposit_funds(amount, name).round(2)
    menu.new_account_balance(new_balance)
  end

  def make_withdrawal
    amount = menu.withdraw_prompt
    if bank_data.balance(name).to_f > amount.to_f
      new_balance = bank_data.withdraw_funds(amount, name).round(2)
      menu.withdraw_output(bank_data.get_dispenser_output)
      menu.new_account_balance(new_balance)
    else
      menu.insuff_funds
    end
  end

  private
  attr_reader :bank_data, :menu, :name, :balance

end
