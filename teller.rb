require "./bank_data.rb"

class Teller

  def initialize(menu)
    @bank_data = BankData.new(menu.name_input)
    @menu = menu
  end

  def customer_valid?
    @bank_data.is_valid?
  end

  def show_balance
    menu.show_account_balance(bank_data.balance)
  end

  def make_deposit
    amount = @menu.deposit_prompt
    @bank_data.deposit_funds(amount, menu)
  end

  def make_withdrawal
    amount = menu.withdraw_prompt
    if bank_data.balance.to_f > amount.to_f
      bank_data.withdraw_funds(amount, menu)
    else
      menu.insuff_funds
    end
  end

  private
  attr_accessor :bank_data, :menu

end
