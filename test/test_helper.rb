ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/emoji'
require 'capybara/rails'
require 'pry'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def create_category_and_items(num)
    num.times do
      category_one = Category.create(name:"coffee#{num}")
      category_one.items.create(title: "pour over#{num}", description: 'it taste really good', price: 4.00, image: "google.com")
      category_one.items.create(title: "drip#{num}",      description: 'it taste good',         price: 4.00, image: "google.com")
    end
  end

  def teardown
    reset_session!
  end
end
