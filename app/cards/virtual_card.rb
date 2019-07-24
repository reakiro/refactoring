require_relative 'card'

class VirtualCard < Card
  attr_accessor :number, :balance, :type

  def initialize
    @type = 'virtual'
    @number = cc_number_generate
    @balance = 150.00
  end

  def withdraw_tax(amount)
    amount * 0.88
  end

  def put_tax(_amount)
    1
  end

  def sender_tax(_amount)
    1
  end
end
