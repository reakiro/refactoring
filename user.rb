require_relative 'validations'

class User
  include Validations

  attr_accessor :errors, :name, :login, :password, :age

  def initialize
    @errors = []
    @name = name_input
    @login = login_input
    @age = age_input
    @password = password_input
  end

  def name_input
    puts 'Enter your name'
    name = gets.chomp
    name unless name_validation(name)
  end

  def login_input
    puts 'Enter your login'
    login = gets.chomp
    login unless login_validation(login)
  end

  def password_input
    puts 'Enter your password'
    password = gets.chomp
    password unless password_validation(password)
  end

  def age_input
    puts 'Enter your age'
    age = gets.chomp.to_i
    age unless age_validation(age)
  end
end
