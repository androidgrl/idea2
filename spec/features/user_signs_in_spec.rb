require 'rails_helper'

RSpec.feature "User signs in" do
  it 'signs in user' do
    User.create(username: "Jamie", password: "password")
    visit sign_in_path

    fill_in "Username", with: "Jamie"
    fill_in "Password", with: "password"
    within "form" do
      click_on "Sign In"
    end

    expect_user_to_be_signed_in(as: "Jamie")
  end
  # Then I see my User page with a list of my ideas, and a link to add a new idea.
  # And I click on "Add idea",
  # And I fill in the form's title and description fields and I select the category that the idea belongs to,  and I select the image that the idea belongs to,
  # Then I see my User page again with the new idea added and the image and
end
