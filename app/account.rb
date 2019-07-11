require 'yaml'

class Account
  attr_accessor :name, :login, :password, :age, :card, :file_path, :errors, :current_account

  def initialize
    @errors = []
    @file_path = 'accounts.yml'
  end
end
