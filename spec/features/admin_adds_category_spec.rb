require 'rails_helper'

RSpec.feature "Admin adds category" do
  it 'unauthorized user unable to see category index' do
    user = User.create(username: "Joe",
                      password: "password",
                      role: 0)

    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit admin_categories_path

    expect(page).to_not have_content("Categories Index")
    expect(page).to have_content("The page you were looking for doesn't exist")
  end

  it 'logged in admin sees category index' do
    admin = User.create(username: "Jamie",
                        password: "password",
                        role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_categories_path

    expect(page).to have_content("Categories Index")
  end

  it 'logged in admin adds a new category' do
     admin = User.create(username: "Jamie",
                        password: "password",
                        role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_categories_path
    click_on "Add Category"
    fill_in "Name", with: "Arts"
    click_on "Add Category"

    # Assert we are on the next page by asserting something that is only on the next page
    expect(page).to have_content 'Categories Index'
    expect(page).to have_content 'Arts'
  end

end
