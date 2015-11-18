ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/emoji'
require 'capybara/rails'
require 'pry'
require 'mocha/mini_test'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def make_admin
    User.create(username: "admin", password: "pw", role: 1)
  end

  def logged_in_admin
    admin = User.create(username: "admin", password: "pw", role: 1)
    visit login_path

    fill_in "Username", with: "admin"
    fill_in "Password", with: "pw"
    click_button "Login"
    admin
  end

  def logged_in_user
    User.create(username: "user", password: "password")
    visit login_path

    fill_in "Username", with: "user"
    fill_in "Password", with: "password"
    click_button "Login"
  end

  def create_category_and_items(num)
    num.times do |i|
      category_one = Category.create(name:"coffee#{i}")
      category_one.items.create(title: "pour over#{i}", description: 'it taste really good', price: 4.00, image: "google.com")
      category_one.items.create(title: "drip#{i}",      description: 'it taste good',         price: 4.00, image: "google.com")
    end
  end

  def teardown
    reset_session!
  end

  def create_user
    User.create(username: 'ryan',
                password: 'waffles')
  end
end
