require 'yaml'
require 'pry'
require_relative 'console'
require_relative 'cards/card_operations'
require_relative 'money_operations'
require_relative 'user_data'

class Account
  attr_accessor :login, :name, :card, :password, :file_path

  include CardOperations
  include MoneyOperations
  include Console

  def initialize
    @errors = []
    @file_path = 'accounts.yml'
  end

  def create
    loop do
      name_input
      age_input
      login_input
      password_input
      break if @errors.empty?

      @errors.each do |e|
        puts e
      end
      @errors = []
    end

    @card = []
    new_accounts = accounts << self
    @current_account = self
    File.open(@file_path, 'w') { |f| f.write new_accounts.to_yaml } # Storing
    main_menu
  end

  def load
    loop do
      return create_the_first_account if accounts.none?

      puts 'Enter your login'
      login = gets.chomp
      puts 'Enter your password'
      password = gets.chomp

      if accounts.map { |a| { login: a.login, password: a.password } }.include?(login: login, password: password)
        a = accounts.select { |a| login == a.login }.first
        @current_account = a
        break
      else
        puts 'There is no account with given credentials'
        next
      end
    end
    main_menu
  end

  def create_the_first_account
    puts "there are no active accounts, type 'y' if you want to create one"
    gets.chomp == 'y' ? create : console
  end

  def destroy_account
    puts 'Are you sure you want to destroy account?[y/n]'
    a = gets.chomp
    if a == 'y'
      new_accounts = []
      accounts.each do |ac|
        if ac.login == @current_account.login
        else
          new_accounts.push(ac)
        end
      end
      File.open(@file_path, 'w') { |f| f.write new_accounts.to_yaml } # Storing
    end
  end

  private

  def name_input
    puts 'Enter your name'
    @name = gets.chomp
    unless @name != '' && @name[0].upcase == @name[0]
      @errors.push('Your name must not be empty and starts with first upcase letter')
    end
  end

  def login_input
    puts 'Enter your login'
    @login = gets.chomp
    @errors.push('Login must present') if @login == ''

    @errors.push('Login must be longer then 4 symbols') if @login.length < 4

    @errors.push('Login must be shorter then 20 symbols') if @login.length > 20

    @errors.push('Such account is already exists') if accounts.map(&:login).include? @login
  end

  def password_input
    puts 'Enter your password'
    @password = gets.chomp
    @errors.push('Password must present') if @password == ''

    @errors.push('Password must be longer then 6 symbols') if @password.length < 6

    @errors.push('Password must be shorter then 30 symbols') if @password.length > 30
  end

  def age_input
    puts 'Enter your age'
    @age = gets.chomp
    if @age.to_i.is_a?(Integer) && @age.to_i >= 23 && @age.to_i <= 90
      @age = @age.to_i
    else
      @errors.push('Your Age must be greeter then 23 and lower then 90')
    end
  end

  def accounts
    if File.exist?('accounts.yml')
      YAML.load_file('accounts.yml')
    else
      []
    end
  end
end
