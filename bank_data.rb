require 'json'

FILE_PATH = "./tullos_bank.json"

class BankData
  attr_accessor :name, :balance, :accounts

  def initialize(customer_name)
    @accounts = JSON.parse(File.read(FILE_PATH))
    @name = customer_name
    @balance = @accounts[customer_name]
  end

  def is_valid?
    if balance
      true
    else
      false
    end
  end

  def write_new_balance(new_hash)
    puts "\nYour new balance is: $#{new_hash[@name]}"
    @data_hash = new_hash
    @balance = new_hash[@name]
    File.open(FILE_PATH, 'w') do |file|
      file.write(new_hash.to_json)
    end
  end
end
