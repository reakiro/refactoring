require_relative '../cards/usual_card'
require_relative '../cards/capitalist_card'
require_relative '../cards/virtual_card'
require_relative 'account_operations'
require_relative '../outputer'
require_relative '../validations'

module CardOperations
  include Outputer
  include FileManager
  include Validations

  def create_card
    loop do
      create_card_output
      cardtype = gets.chomp
      card = generate_card(cardtype)
      return puts "Wrong card type. Try again!\n" if card.nil?

      cards = @current_account.card << card
      @current_account.card = cards
      update_accounts(@current_account)
      break
    end
  end

  def destroy_card
    loop do
      puts 'If you want to delete:'
      break unless show_cards_for_operations

      exit_message
      choice = gets.chomp
      break if choice == 'exit'

      return puts "You entered wrong number!\n" unless answer_validation(choice)

      puts "Are you sure you want to delete #{@current_account.card[choice.to_i - 1].number}?[y/n]"
      confirmation = gets.chomp
      return unless confirmation == 'y'

      @current_account.card.delete_at(choice.to_i - 1)
      update_accounts(@current_account)
      break
    end
  end

  def show_cards
    return puts "There is no active cards!\n" unless cards

    @current_account.card.each do |card|
      puts "- #{card.number}, #{card.type}"
    end
  end

  def show_cards_for_operations
    return puts "There is no active cards!\n" unless cards

    @current_account.card.each_with_index do |card, index|
      puts "- #{card.number}, #{card.type}, press #{index + 1}"
    end
  end

  def card_present(card)
    @current_account.card.include? card
  end

  def cards
    @current_account.card.any?
  end

  def generate_card(type)
    case type
    when 'usual'
      UsualCard.new
    when 'capitalist'
      CapitalistCard.new
    when 'virtual'
      VirtualCard.new
    end
  end
end
