require 'rails_helper'

RSpec.describe Idea, type: :model do
  let(:idea) { Idea.new(title: "Art in the Park",
                       description: "Let's have free art in the park",
                       user_id: 1,
                       category_id: 1)}

  it 'is valid' do
    expect(idea).to be_valid
  end

  it 'is invalid without a title' do
    idea.title = nil

    expect(idea).to_not be_valid
  end

  it 'is invalid without a description' do
    idea.description = nil

    expect(idea).to_not be_valid
  end
end
