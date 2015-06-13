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

  xit "responds with its created ideas" do
    category.ideas.build(name: "Art in the Redwoods")
    expect(category.ideas.map(&:name)).to eq(["Art in the Redwoods"])
  end
end
