require_relative '../validations'

module UserData
  include Validations

  def name_input
    puts 'Enter your name'
    name = gets.chomp
    name_validation(name)
    @name = name if valid?
  end

  def login_input
    puts 'Enter your login'
    login = gets.chomp
    login_validation(login)
    @login = login if valid?
  end

  def password_input
    puts 'Enter your password'
    password = gets.chomp
    password_validation(password)
    @password = password if valid?
  end

  def age_input
    puts 'Enter your age'
    age = gets.chomp.to_i
    age_validation(age)
    @age = age if valid?
  end

  def set_credentials
    name_input
    age_input
    login_input
    password_input
  end
end
