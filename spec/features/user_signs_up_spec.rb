require 'rails_helper'

RSpec.feature "User signs up" do
  scenario "successfully" do
    visit root_path
    click_on "Sign Up"

    fill_in "Username", with: "Jamie"
    fill_in "Password", with: "password"
    within "form" do
      click_on "Sign Up"
    end

    expect_user_to_be_signed_in(as: "Jamie")
  end
end
