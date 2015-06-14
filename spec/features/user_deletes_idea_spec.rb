require 'rails_helper'

RSpec.feature "User adds idea" do
  before(:each) do
    @user = User.create(username: "Jamie",
                        password: "password",
                        role: 0)
  end

  it 'user can delete an idea' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit user_path(@user)

    click_on "Add Idea"
    fill_in "Title", with: "Free Art"
    fill_in "Description", with: "Make art free day"
    click_on "Submit Idea"
    @user.reload
    visit user_path(@user)

    click_on "Delete"
    @user.reload
    visit user_path(@user)

    expect(page).to_not have_content("Free Art")
    expect(page).to_not have_content("Make art free day")
  end
end

