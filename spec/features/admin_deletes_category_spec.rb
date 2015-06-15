require 'rails_helper'

RSpec.feature "Admin deletes category" do
  it 'logged in admin adds a new category' do
     admin = User.create(username: "Jamie",
                        password: "password",
                        role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_categories_path
    click_on "Add Category"
    fill_in "Name", with: "Arts"
    click_on "Add Category"

    click_on "Delete"
    expect(page).to_not have_content 'Arts'
  end
end

