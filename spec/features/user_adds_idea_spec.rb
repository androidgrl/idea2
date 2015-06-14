require 'rails_helper'

RSpec.feature "User adds idea" do
  xit 'a user can add an idea' do
    user = User.create(username: "Jamie",
                      password: "password",
                      role: 0)

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit user_path(user)

    click_on "Add Idea"
    fill_in "Title", with: "Free Art"
    fill_in "Description", with: "Make art free day"
    click_on "Submit Idea"

    expect(page).to have_content("Jamie's Ideas")
    expect(page).to have_content("Free Art")
  end
end
  # And I fill in the form's title and description fields and I select the category that the idea belongs to,  and I select the image that the idea belongs to,
  # Then I see my User page again with the new idea added and the image and

