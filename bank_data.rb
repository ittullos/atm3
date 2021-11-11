require 'json'

FILE_PATH = "./tullos_bank.json"

class BankData

  def initialize
    @accounts = JSON.parse(File.read(FILE_PATH))
  end

  def balance(name)
    accounts[name]
  end

  def deposit_funds(amount, name)
    new_balance = balance(name).to_f + amount.to_f
    write_new_balance(new_balance.round(2), name)
  end

  def withdraw_funds(amount, name)
    new_balance = balance(name).to_f - amount.to_f
    write_new_balance(new_balance.round(2), name)
  end

  def write_new_balance(new_balance, name)
    accounts[name] = new_balance.to_s
    File.open(FILE_PATH, 'w') do |file|
      file.write(accounts.to_json)
    end
    new_balance
  end

  private
  attr_reader :accounts

end
