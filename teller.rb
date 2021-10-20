require "./bank_data.rb"

BILL_DENOMS = [100,50,20,10,5,1]
COIN_DENOMS = [50,25,10,5,1]
BILL_NAMES  = {100=>"Hundreds",50=>"Fiftys",20=>"Twentys",10=>"Tens",5=>"Fives",1=>"Ones"}
COIN_NAMES  = {50=>"Half Dollar",25=>"Quarter",10=>"Dimes",5=>"Nickels",1=>"Pennys"}

class Teller

  def initialize(menu)
    @bank_data = BankData.new
    @tell_prompt = menu
    @bank_data.get_data

    until @bank_data.isvalid?
      @bank_data.get_data
    end
  end

  def show_balance
    puts "\nYour account balance is: $" + @bank_data.balance
  end

  def make_deposit
    hash = @bank_data.data_hash
    amount = @tell_prompt.deposit_prompt.to_f
    bal = hash[@bank_data.name].to_f
    bal += amount
    hash[@bank_data.name] = bal.round(2).to_s
    @bank_data.write_new_balance(hash)
  end

  def make_withdrawal
    hash = @bank_data.data_hash
    amount = @tell_prompt.withdraw_prompt.to_f
    bal = hash[bank_data.name].to_f
    if bal >= amount
      @bills = amount.floor
      @coins = (amount % @bills) * 100
      bill_hash = dispense(bills, BILL_DENOMS)
      coin_hash = dispense(coins, COIN_DENOMS)
      @tell_prompt.withdraw_output(bill_hash, coin_hash, BILL_NAMES, COIN_NAMES)
      bal -= amount
      hash[bank_data.name] = bal.round(2).to_s
      @bank_data.write_new_balance(hash)
    else
      puts "Insufficient funds. Please try again.."
    end
  end

  private
  attr_accessor :bills, :coins, :bank_data, :tell_prompt

  def dispense(amount, denominations)
    data = denominations.inject({}) do |hash, denomination|
      hash[denomination] = amount.divmod(denomination)
      amount -= amount.divmod(denomination).first * denomination
      hash
    end
    data.map do |key, value|
      data[key] = value.first
    end
    data
  end
end
