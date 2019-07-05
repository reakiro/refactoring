class Card
  def cc_number_generate
    16.times.map { rand(10) }.join
  end

  def card_info
    {
      type: @type,
      number: @number,
      balance: @balance
    }
  end
end
