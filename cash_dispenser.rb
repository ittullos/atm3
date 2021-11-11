DENOMINATIONS = [10000,5000,2000,1000,500,100,50,25,10,5,1]
DENOM_NAMES   = ["Hundreds","Fiftys","Twentys","Tens","Fives",
                 "Ones","Half Dollars","Quarters",
                 "Dimes","Nickels","Pennys"]

class CashDispenser

  def dispense(amount)
    data = DENOMINATIONS.inject({}) do |hash, denomination|
      hash[denomination] = amount.divmod(denomination)
      amount -= amount.divmod(denomination).first * denomination
      hash
    end
    data.map do |key, value|
      data[key] = value.first
    end
    data.transform_keys!.each_with_index {|key, index| key = DENOM_NAMES[index]}
    data
  end
end
