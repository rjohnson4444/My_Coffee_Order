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
    User.create(username: "admin", password: "pw", address: "1111 Maple Rd", city: "Denver", state: "CO", zip: 82020, role: 1)
  end

  def user_makes_an_order
    user = logged_in_user
    create_category_and_items(1)
    item1 = Item.first

    visit items_path

    within "#item#{item1.id}" do
      click_button "Add to Cart"
    end

    click_button "View Cart"
    click_button "Checkout"
    user
  end

  def admin_makes_an_order
    admin = logged_in_admin
    create_category_and_items(1)
    item1 = Item.first

    visit items_path

    within "#item#{item1.id}" do
      click_button "Add to Cart"
    end

    click_button "View Cart"

    click_button "Checkout"
    admin
  end

  def logged_in_admin
    admin = User.create(username: "admin", password: "pw", address: "1111 Maple Rd", city: "Denver", state: "CO", zip: 82020, role: 1)
    visit login_path

    fill_in "Username", with: "admin"
    fill_in "Password", with: "pw"
    click_button "Login"
    admin
  end

  def logged_in_user
    user = User.create(username: "user", password: "password", address: "1111 Maple Rd", city: "Denver", state: "CO", zip: 82020)
    visit login_path

    fill_in "Username", with: "user"
    fill_in "Password", with: "password"
    click_button "Login"
    user
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
    User.create(username: "ryan", password: "waffles", address: "1111 Maple Rd", city: "Denver", state: "CO", zip: 82020)
  end
end
