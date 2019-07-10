require_relative 'account'
require_relative 'helpers/console_module'
require_relative 'operations/account_operations'
require_relative 'operations/card_operations'
require_relative 'operations/money_operations'
require_relative 'helpers/user_data'
require_relative 'helpers/file_manager'

class Console
  include ConsoleModule
  include AccountOperations
  include CardOperations
  include UserData
  include FileManager
  include MoneyOperations

  attr_accessor :account

  def initialize
    @account = Account.new
  end

  def run
    console
  end
end
