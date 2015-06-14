require 'rails_helper'

RSpec.feature "User adds idea" do
  before(:each) do
    @user = User.create(username: "Jamie",
                        password: "password",
                        role: 0)
  end

  it 'a user can add an idea' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit user_path(@user)

    click_on "Add Idea"
    fill_in "Title", with: "Free Art"
    fill_in "Description", with: "Make art free day"
    click_on "Submit Idea"
    @user.reload
    visit user_path(@user)

    expect(page).to have_content("Jamie's Ideas:")
    expect(page).to have_content("Free Art")
  end

  it 'user can edit an idea' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit user_path(@user)

    click_on "Add Idea"
    fill_in "Title", with: "Free Art"
    fill_in "Description", with: "Make art free day"
    click_on "Submit Idea"
    @user.reload
    visit user_path(@user)

    click_on "Edit"
    fill_in "Title", with: "Free Art in the Park"
    fill_in "Description", with: "Have free art demos in the park"
    click_on "Submit Idea"
    @user.reload
    visit user_path(@user)

    expect(page).to have_content("Jamie's Ideas:")
    expect(page).to have_content("Have free art demos in the park")
  end
end
# And I fill in the form's title and description fields and I select the category that the idea belongs to,  and I select the image that the idea belongs to,
# Then I see my User page again with the new idea added and the image that it's associated with and the category that it belongs to.

