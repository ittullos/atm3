require "./teller.rb"
require "./menu.rb"

menu = Menu.new
menu.greeting
menu.get_name
teller = Teller.new(menu)
until teller.customer_valid?
  menu.reprimand_customer
  menu.get_name
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
    puts "Invalid menu selection. Please try again.."
  end
end
