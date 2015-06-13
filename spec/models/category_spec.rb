require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { Category.new(name: "Arts") }

  it 'is valid' do
    expect(category).to be_valid
  end

  it 'is invalid without a name' do
    category.name = nil

    expect(category).to_not be_valid
  end
end
