require 'yaml'
require 'pry'
require_relative 'console'
require_relative 'operations/card_operations'
require_relative 'operations/money_operations'
require_relative 'operations/account_operations'
require_relative 'helpers/file_manager'
require_relative 'helpers/user_data'

class Account
  attr_accessor :name, :login, :password, :age, :card, :file_path

  include CardOperations
  include MoneyOperations
  include AccountOperations
  include Console
  include UserData

  def initialize
    @errors = []
    @file_path = 'accounts.yml'
  end
end
