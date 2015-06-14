# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
end

  def expect_user_to_be_signed_in(as:)
    expect(page).not_to have_content("Sign In")
    expect(page).not_to have_content("Sign Up")
    expect(page).to have_content("Sign Out")
    expect(page).to have_content(as)
  end

  def expect_user_to_be_logged_out
    expect(page).not_to have_content("Sign Out")
    expect(page).to have_content("Sign In")
    expect(page).to have_content("Sign Up")
  end
