require "spec_helper"
require "models/money"

RSpec.describe Money do
  it "can be added together" do
    money = Money.new(1, "USD")
    other_money = Money.new(5, "USD")

    expect(money + other_money).to eq(Money.new(6, "USD"))
  end

  it "cannot be added to money of other currencies" do
    real_money = Money.new(1, "USD")
    monopoly_money = Money.new(1, "CAD")

    expect { real_money + monopoly_money }.to raise_error(ArgumentError)
  end
end
