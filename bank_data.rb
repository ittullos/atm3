require 'json'

FILE_PATH = "./tullos_bank.json"

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
    puts "balance: #{balance} amount: #{amount}"
    new_balance = balance.to_f + amount.to_f
    puts "new_balance: #{new_balance}"
    write_new_balance(new_balance)
  end

  def write_new_balance(new_balance)
    accounts[name] = new_balance
    puts "\nYour new balance is: $#{accounts[name]}"
    File.open(FILE_PATH, 'w') do |file|
      file.write(accounts.to_json)
    end
  end
end
