class CashDispenser

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
