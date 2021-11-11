BANK_NAME   = "Tullos Bank"

GREETING = <<-GREETING

    Welcome to #{BANK_NAME}
You can trust us with your money!
GREETING
OPTIONS = <<-OPTIONS

Please enter a menu selection:

  1 - Check your balance

  2 - Make a withdrawal

  3 - Make a deposit

  4 - Exit

OPTIONS

GOODBYE = <<-GOODBYE

Thank you for choosing #{BANK_NAME}!
      Have a great day!
GOODBYE

MESSAGES = {"get_name"=>"\nPlease enter your name: ",
            "how_much"=>"\nPlease enter an amount: $",
            "invalid_customer"=>"\n  ->That name is invalid.. Please try again.",
            "invalid_menu_selection"=>"\n  ->Invalid menu selection. Please try again..",
            "new_account_balance"=>"\n  Your new balance is: $",
            "show_account_balance"=>"\n  Your account balance is: $",
            "insuff_funds"=>"\n  ->Insufficient funds. Please try again..",
            "greeting"=>GREETING,"display_options"=>OPTIONS,"goodbye"=>GOODBYE}
