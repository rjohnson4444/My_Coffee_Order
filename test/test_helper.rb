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

  def add_2
    visit items_path
    item1 = Item.find_by(title: "pour over0")
    item2 = Item.find_by(title: "drip0")

    within "#item#{item1.id}" do
      click_button "Add to Cart"
    end

    within "#item#{item2.id}" do
      click_button "Add to Cart"
    end

    click_button "View Cart"
    click_button "Checkout"
    fill_in 'Username', with: 'ryan'
    fill_in "Password", with: 'waffles'
    click_button "Login"

    assert '/dashboard', current_path

    click_link "Cart"
    click_button "Checkout"
  end

  def user_registration
    visit root_path
    click_link "Sign Up"

    fill_in "Username", with: "user"
    fill_in "Password", with: "pw"
    fill_in "Password confirmation", with: "pw"
    fill_in "Address", with: "1111 Maple Rd"
    fill_in "City", with: "Denver"
    fill_in "State", with: "CO"
    fill_in "Zip", with: 82020

    click_button "Create Account"
  end

  def visitor_adds_to_cart
    create_category_and_items(1)
    item1 = Item.first

    visit items_path

    within "#item#{item1.id}" do
      click_button "Add to Cart"
    end

    click_button "View Cart"
    click_button "Checkout"
  end
end
