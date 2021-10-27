require "./cash_dispenser.rb"
require 'json'

FILE_PATH     = "./tullos_bank.json"
DENOMINATIONS = [10000,5000,2000,1000,500,100,50,25,10,5,1]

class BankData

  def initialize(customer_name)
    @accounts = JSON.parse(File.read(FILE_PATH))
    @name = customer_name
  end

  def balance(name)
    accounts[name]
  end

  def get_dispenser_output
    dispenser_output
  end

  def deposit_funds(amount, name)
    new_balance = balance(name).to_f + amount.to_f
    write_new_balance(new_balance.round(2), name)
    new_balance
  end

  def withdraw_funds(amount, name)
    dispenser = CashDispenser.new
    total = (amount.to_f * 100).to_i
    @dispenser_output = dispenser.dispense(total, DENOMINATIONS)
    new_balance = balance(name).to_f - amount.to_f
    write_new_balance(new_balance.round(2), name)
    new_balance
  end

  def write_new_balance(new_balance, name)
    accounts[name] = new_balance.to_s
    File.open(FILE_PATH, 'w') do |file|
      file.write(accounts.to_json)
    end
  end

  private
  attr_reader :accounts, :dispenser_output

end
