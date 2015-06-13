require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(username: "Jamie",
                        password_digest: "password",
                        role: 0)}

  it 'is valid' do
    expect(user).to be_valid
  end

  it 'is invalid without a username' do
    user.username = nil

    expect(user).to_not be_valid
  end

  it 'is invalid without a password_digest' do
    user.password_digest = nil

    expect(user).to_not be_valid
  end
end
