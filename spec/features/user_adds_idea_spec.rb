require 'rails_helper'

RSpec.feature "User adds idea" do
  xit 'a user can add an idea' do
    visit sign_in_path

    fill_in "Username", with: "Jamie"
    fill_in "Password", with: "password"
    within "form" do
      click_on "Sign In"
    end

    click_on "Add Idea"
    fill_in "Title", with: "Free Art"
    fill_in "Description", with: "Make art free day"

  end
end
  # And I fill in the form's title and description fields and I select the category that the idea belongs to,  and I select the image that the idea belongs to,
  # Then I see my User page again with the new idea added and the image and

