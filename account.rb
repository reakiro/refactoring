require 'yaml'
require 'pry'
require_relative 'console'
require_relative 'operations/card_operations'
require_relative 'operations/money_operations'
require_relative 'operations/account_operations'
require_relative 'file_manager'
require_relative 'user'

class Account
  attr_accessor :login, :name, :card, :password, :file_path, :user

  include CardOperations
  include MoneyOperations
  include AccountOperations
  include Console

  def initialize
    @errors = []
    @file_path = 'accounts.yml'
  end

  def create
    loop do
      @user = User.new
      @user.set_credentials
      @errors = @user.errors
      break if @errors.empty?

      errors_output
      @errors = []
    end
    @card = []
    new_accounts = accounts << self
    @current_account = self
    write_to_file(new_accounts)
    main_menu
  end

  def load
    loop do
      return create_the_first_account if accounts.none?

      login = get_login
      password = get_password
      next puts 'There is no account with given credentials' unless account_exist(login, password)

      @current_account = accounts.select { |account| login == account.user.login }.first
      break
    end
    main_menu
  end
end
