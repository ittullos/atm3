require "./cash_dispenser.rb"
require 'json'

FILE_PATH = "./tullos_bank.json"
BILL_DENOMS = [100,50,20,10,5,1]
COIN_DENOMS = [50,25,10,5,1]
BILL_NAMES = {100=>"Hundreds",50=>"Fiftys",20=>"Twentys",10=>"Tens",5=>"Fives",1=>"Ones"}
COIN_NAMES = {50=>"Half Dollar",25=>"Quarter",10=>"Dimes",5=>"Nickels",1=>"Pennys"}

class BankData
  attr_accessor :name, :accounts

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

  def deposit_funds(amount)
    new_balance = balance.to_f + amount.to_f
    write_new_balance(new_balance.to_s)
  end

  def withdraw_funds(amount, menu)
    cash_dispenser = CashDispenser.new
    bills = amount.to_f.floor
    coins = (amount.to_f % bills) * 100
    bill_amounts = cash_dispenser.dispense(bills, BILL_DENOMS)
    coin_amounts = cash_dispenser.dispense(coins, COIN_DENOMS)
    menu.withdraw_output(bill_amounts, coin_amounts, BILL_NAMES, COIN_NAMES)
    new_balance = balance.to_f - amount.to_f
    write_new_balance(new_balance.to_s)
  end

  def write_new_balance(new_balance)
    accounts[name] = new_balance
    puts "\nYour new balance is: $#{accounts[name]}"
    File.open(FILE_PATH, 'w') do |file|
      file.write(accounts.to_json)
    end
  end
end
