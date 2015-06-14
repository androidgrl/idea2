require 'rails_helper'

RSpec.feature "User signs in" do
  it 'user can logout' do
    User.create(username: "Jamie", password: "password")
    visit sign_in_path

    fill_in "Username", with: "Jamie"
    fill_in "Password", with: "password"
    within "form" do
      click_on "Sign In"
    end

    expect_user_to_be_signed_in(as: "Jamie")

    click_on "Sign Out"

    expect_user_to_be_logged_out
  end
end
