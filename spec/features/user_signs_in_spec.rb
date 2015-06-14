require 'rails_helper'

RSpec.feature "User signs in" do
  before(:each) do
    @user = User.create(username: "Jamie", password: "password")
  end

  it 'signs in user' do
    visit sign_in_path

    fill_in "Username", with: "Jamie"
    fill_in "Password", with: "password"
    within "form" do
      click_on "Sign In"
    end

    expect_user_to_be_signed_in(as: "Jamie")
  end

  it 'shows a list of ideas belonging to a user' do
    @user.ideas.create(title: "Free Art", description: "Art for free")
    visit sign_in_path

    fill_in "Username", with: "Jamie"
    fill_in "Password", with: "password"
    within "form" do
      click_on "Sign In"
    end

    expect(page).to have_content("Free Art")
    expect(page).to have_link("Add Idea", href: new_idea_path)
  end
  # And I click on "Add idea",
  # And I fill in the form's title and description fields and I select the category that the idea belongs to,  and I select the image that the idea belongs to,
  # Then I see my User page again with the new idea added and the image and
end
