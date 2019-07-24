require_relative 'card'

class CapitalistCard < Card
  attr_accessor :number, :balance, :type

  def initialize
    @type = 'capitalist'
    @number = cc_number_generate
    @balance = 100.00
  end

  def withdraw_tax(amount)
    amount * 0.04
  end

  def put_tax(_amount)
    10
  end

  def sender_tax(amount)
    amount * 0.1
  end
end
