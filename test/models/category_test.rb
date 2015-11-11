require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def valid_attributes
    @category = Category.new(name: "Coffee")
  end

  test "is valid" do
    valid_attributes

    assert @category.valid?
  end

  test "is invalid without a name" do
    no_name_category = Category.new(name: "")

    refute no_name_category.valid?
  end

  test "is associated with items" do
    valid_attributes

    assert_respond_to @category, :items
  end
end
