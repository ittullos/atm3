require './bank_data'
require './teller'
require './menu'

menu = Menu.new
bank_data = BankData.new
teller = Teller.new(menu,bank_data)
teller.work
