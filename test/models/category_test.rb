require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def valid_category
    Category.new(name: "Coffee")
  end

  test "is valid" do
    assert valid_category.valid?
  end

  test "is invalid without a name" do
    no_name_category = Category.new(name: "")

    refute no_name_category.valid?
  end

  test "is associated with items" do
    assert_respond_to valid_category, :items
  end
end
