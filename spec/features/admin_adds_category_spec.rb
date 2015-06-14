require 'rails_helper'

RSpec.feature "Admin adds category" do
  it 'unauthorized user unable to see category index' do
    user = User.create(username: "Joe",
                      password: "password",
                      role: 0)

    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit admin_categories_path

    refute page.has_content?("Categories Index")
    assert page.has_content?("The page you were looking for doesn't exist")
  end

  it 'logged in admin sees category index' do
    admin = User.create(username: "Jamie",
                        password: "password",
                        role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_categories_path

    assert page.has_content?("Categories Index")
  end

  it 'logged in admin adds a new category' do
     admin = User.create(username: "Jamie",
                        password: "password",
                        role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_categories_path
    click_on "Add Category"
  end
end
