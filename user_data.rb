require_relative 'validations'

module UserData
  include Validations

  def name_input
    puts 'Enter your name'
    name = gets.chomp
    @name = name unless name_validation(name)
  end

  def login_input
    puts 'Enter your login'
    login = gets.chomp
    @login = login unless login_validation(login)
  end

  def password_input
    puts 'Enter your password'
    password = gets.chomp
    @password = password unless password_validation(password)
  end

  def age_input
    puts 'Enter your age'
    age = gets.chomp.to_i
    @age = age unless age_validation(age)
  end
end
