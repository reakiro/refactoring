module Outputer
  def create_card_output
    puts 'You could create one of 3 card types'
    puts '- Usual card. 2% tax on card INCOME. 20$ tax on SENDING money from this card. 5% tax on WITHDRAWING money. For creation this card - press `usual`'
    puts '- Capitalist card. 10$ tax on card INCOME. 10% tax on SENDING money from this card. 4$ tax on WITHDRAWING money. For creation this card - press `capitalist`'
    puts '- Virtual card. 1$ tax on card INCOME. 1$ tax on SENDING money from this card. 12% tax on WITHDRAWING money. For creation this card - press `virtual`'
    puts '- For exit - press `exit`'
  end

  def main_menu_output
    puts "\nWelcome, #{@account.current_account.name}"
    puts 'If you want to:'
    puts '- show all cards - type SC'
    puts '- create card - type CC'
    puts '- destroy card - type DC'
    puts '- put money on card - type PM'
    puts '- withdraw money on card - type WM'
    puts '- send money to another card  - type SM'
    puts '- destroy account - type DA'
    puts '- exit from account - type exit'
  end

  def console_output
    puts 'hello, we are RubyG bank!'
    puts '- if you want to create account - type create'
    puts '- if you want to load account - type load'
    puts '- if you want to exit - type anything else'
  end

  def exit_message
    puts "press `exit` to exit\n"
  end

  def errors_output
    @account.errors.each do |error|
      puts error
    end
  end
end
