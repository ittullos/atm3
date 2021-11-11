require './menu_messages'

class Menu

  def prompt(keyword, value = "")
    print MESSAGES[keyword]
    puts value if value != ''
    print "   => " if keyword == 'display_options'
    gets.chomp
  end

  def display(keyword, value = "")
    if keyword == 'withdraw_output'
      puts "\nDispensing cash..."
      value.each do |denom, quantity|
        puts "  #{denom} -> #{quantity}" if quantity > 0
      end
    else
      print MESSAGES[keyword]
      if value != ''
        puts value
      elsif keyword != 'greeting'
        print "\n"
      end
    end
  end
end
