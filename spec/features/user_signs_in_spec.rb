require 'rails_helper'

RSpec.feature "User signs in" do
  scenario "successfully" do
    visit root_path
    click_on "Sign Up"

    fill_in "Username", with: "Jamie"
    fill_in "Password", with: "password"
    within "form" do
      click_on "Sign Up"
    end

    expect_user_to_be_signed_in(as: "Jamie")
    # Then I see my User page with a list of my ideas, and a link to add a new idea.
    # And I click on "Add idea",
    # And I fill in the form's title and description fields and I select the category that the idea belongs to,  and I select the image that the idea belongs to,
    # Then I see my User page again with the new idea added and the image and
  end

  private

  def expect_user_to_be_signed_in(as:)
    expect(page).not_to have_content("Sign In")
    expect(page).not_to have_content("Sign Up")
    expect(page).to have_content("Sign Out")
    expect(page).to have_content(as)
  end
end
