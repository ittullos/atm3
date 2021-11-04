REQUEST_OPTIONS = {"1"=>"show_account_balance","2"=>"withdraw",
                   "3"=>"deposit","4"=>"exit"}

class Teller

  def initialize(menu, bank_data, cash_dispenser)
    @menu = menu
    @bank_data = bank_data
    @cash_dispenser = cash_dispenser
  end

  def work
    menu.display("greeting")
    customer_setup
    exit_flag = false
    until exit_flag
      request = get_request
      if request[0] == 'exit'
        menu.display("goodbye")
        exit_flag = true
      elsif request[0] == 'deposit' || request[0] == 'withdraw'
        send(:"#{request[0]}", request[1])
      elsif request[0] == 'show_account_balance'
        menu.display("#{request[0]}", balance)
      else
        menu.display("#{request[0]}")
      end
    end
  end

  def customer_setup
    until balance
      @name = menu.prompt("get_name")
      @balance = bank_data.balance(name)
      unless balance
        menu.display("invalid_customer")
      end
    end
  end

  def get_request
    request = menu.prompt("display_options")
    request = REQUEST_OPTIONS.fetch(request, 'invalid_menu_selection')
    if request == 'deposit' || request =='withdraw'
      amount = menu.prompt("how_much").to_f
    end
    [request, amount]
  end

  def withdraw(amount)
    if balance.to_f > amount.to_f
      @balance = bank_data.withdraw_funds(amount, name).round(2)
      dispenser_output = cash_dispenser.dispense(amount * 100)
      menu.display("withdraw_output", dispenser_output)
      menu.display("new_account_balance", balance)
    else
      menu.display("insuff_funds")
    end
  end

  def deposit(amount)
    @balance = bank_data.deposit_funds(amount, name).round(2)
    menu.display("new_account_balance", balance)
  end

  private
  attr_reader :bank_data, :menu, :cash_dispenser, :name, :balance

end
