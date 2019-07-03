module Console
  def console
    puts 'hello, we are RubyG bank!'
    puts '- if you want to create account - type create'
    puts '- if you want to load account - type load'
    puts '- if you want to exit - type anything else'

    choice = gets.chomp

    case choice
    when 'create' then create
    when 'load'   then load
    else exit
    end
  end

  def main_menu
    commands = {
        SC: Proc.new{ show_cards },
        CC: Proc.new{ create_card },
        DC: Proc.new{ destroy_card },
        PM: Proc.new{ put_money },
        WM: Proc.new{ withdraw_money },
        SM: Proc.new{ send_money },
        DA: Proc.new{ destroy_account; exit },
        exit: Proc.new{ exit; break }
    }

    loop do
      puts "\nWelcome, #{@current_account.name}"
      puts 'If you want to:'
      puts '- show all cards - type SC'
      puts '- create card - type CC'
      puts '- destroy card - type DC'
      puts '- put money on card - type PM'
      puts '- withdraw money on card - type WM'
      puts '- send money to another card  - type SM'
      puts '- destroy account - type DA'
      puts '- exit from account - type exit'   

      command = gets.chomp

      if commands.key?(command.to_sym)
        commands[command.to_sym].call
      else
        puts "Wrong command. Try again!\n"
      end
    end
  end
end
