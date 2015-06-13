class Money
  attr_reader :amount, :currency

  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def +(other)
    unless currency == other.currency
      raise ArgumentError, "conversion rates are hard"
    end
    Money.new(amount + other.amount, currency)
  end

  def ==(other)
    other.is_a?(Money) &&
      other.amount == amount &&
      other.currency == currency
  end
end
