require "./teller.rb"
require "./menu.rb"

menu = Menu.new
menu.greeting
teller = Teller.new(menu)

until menu.user_input == "4"

  menu.main_menu

  case menu.user_input
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
