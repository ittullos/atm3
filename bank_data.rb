require "./cash_dispenser.rb"
require 'json'

FILE_PATH = "./tullos_bank.json"
DENOMINATIONS = [10000,5000,2000,1000,500,100,50,25,10,5,1]

class BankData

  def initialize(customer_name)
    @accounts = JSON.parse(File.read(FILE_PATH))
    @name = customer_name
  end

  def balance
    accounts[name]
  end

  def is_valid?
    if balance
      true
    else
      false
    end
  end

  def deposit_funds(amount, menu)
    new_balance = balance.to_f + amount.to_f
    write_new_balance(new_balance.round(2).to_s, menu)
  end

  def withdraw_funds(amount, menu)
    dispenser = CashDispenser.new
    total = (amount.to_f * 100).to_i
    quantity = dispenser.dispense(total, DENOMINATIONS)
    menu.withdraw_output(quantity)
    new_balance = balance.to_f - amount.to_f
    write_new_balance(new_balance.round(2).to_s, menu)
  end

  def write_new_balance(new_balance, menu)
    accounts[name] = new_balance
    menu.new_account_balance(new_balance)
    File.open(FILE_PATH, 'w') do |file|
      file.write(accounts.to_json)
    end
  end

  private
  attr_accessor :name, :accounts
  
end
