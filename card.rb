class Card

  attr_accessor :card_types, :type, :number, :balance

  def initialize
    @type = ''
    @number = 0
    @balance = 0
    @card_types = {
      usual: 50.00,
      capitalist: 100.00,
      virtual: 150.00
    }
  end

  def generate_card(type)
    @type = type
    @number = cc_number_generate
    @balance = @card_types[type.to_sym]
  end

  def cc_number_generate
    16.times.map{rand(10)}.join
  end

  def card_info
    {
      type: @type,
      number: @number,
      balance: @balance
    }
  end
end