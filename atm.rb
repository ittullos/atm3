require "./teller.rb"
require "./menu.rb"

menu = Menu.new
menu.greeting
teller = Teller.new(menu)
teller.set_name

until teller.customer_valid?
  menu.invalid_customer
  teller.set_name
end

until menu.menu_selection == "4"
  menu.main_menu
  case menu.menu_selection
  when "1"
    teller.show_balance
  when "2"
    teller.make_withdrawal
  when "3"
    teller.make_deposit
  when "4"
    menu.goodbye
    break
  else
    menu.invalid_menu_selection
  end
end
