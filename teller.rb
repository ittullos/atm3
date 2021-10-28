class Teller

  def initialize(menu, bank_data)
    @menu = menu
    @bank_data = bank_data
  end

  def work
    menu.greeting
    customer_setup
    exit_flag = false
    until exit_flag
      request = get_request
      if request[0] == 'exit'
        menu.goodbye
        exit_flag = true
      elsif request[0] == 'balance'
        menu.show_account_balance(balance)
      elsif request[0] == 'withdraw'
        make_withdrawal(request[1])
      elsif request[0] == 'deposit'
        make_deposit(request[1])
      elsif request[0] == 'invalid'
        menu.invalid_menu_selection
      end
    end
  end

  def customer_setup
    until balance
      @name = menu.get_name
      @balance = bank_data.balance(name)
      unless balance
        menu.invalid_customer
      end
    end
  end

  def get_request
    request = menu.display_options
    if request == 'deposit' || request == 'withdraw'
      amount = menu.how_much(request).to_f
    elsif request == 'balance' || request == 'exit'
      amount = 0.0
    else
      request = "invalid"
      amount = 0.0
    end
    [request, amount]
  end

  def make_withdrawal(amount)
    if balance.to_f > amount.to_f
      @balance = bank_data.withdraw_funds(amount, name).round(2)
      menu.withdraw_output(bank_data.get_dispenser_output)
      menu.new_account_balance(balance)
    else
      menu.insuff_funds
    end
  end

  def make_deposit(amount)
    @balance = bank_data.deposit_funds(amount, name).round(2)
    menu.new_account_balance(balance)
  end

  private
  attr_reader :bank_data, :menu, :name, :balance

end
