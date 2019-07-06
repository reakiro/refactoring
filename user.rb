require_relative 'validations'
require_relative 'user_data'

class User
  include UserData

  attr_accessor :errors, :name, :login, :password, :age

  def initialize
    @errors = []
    @name = ""
    @age = ""
    @login = ""
    @password = ""
  end

  def set_credentials
    name_input
    age_input
    login_input
    password_input
  end
end
