class Card
  def cc_number_generate
    Array.new(16) { rand(10) }.join
  end

  def card_info
    {
      type: @type,
      number: @number,
      balance: @balance
    }
  end
end
