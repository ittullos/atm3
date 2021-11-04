require './bank_data'
require './teller'
require './menu'
require './cash_dispenser'

menu = Menu.new
bank_data = BankData.new
cash_dispenser = CashDispenser.new
teller = Teller.new(menu,bank_data,cash_dispenser)
teller.work
