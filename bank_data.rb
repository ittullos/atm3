require 'json'

FILE_PATH = "./tullos_bank.json"

class BankData
  attr_accessor :name, :balance, :data_hash

  def get_data
    print "\nPlease enter your name: "
    @data_hash = JSON.parse(File.read(FILE_PATH))
    @name = gets.chomp
    @balance = @data_hash[@name]
  end

  def isvalid?
    if @data_hash[@name]
      true
    else
      puts "\nSorry, we could not find an account with that name.."
      puts "Did you misspell your login name?"
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
