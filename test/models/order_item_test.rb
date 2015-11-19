require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  def valid_order
    Order.new(user_id: 1, sum: 2, quantity: 1, status: 1)
  end

  def valid_item
    Item.new(title: "coffee", description: "The best coffee that you can drink", price: 4, image: "www.google.com", category_id: 1, slug: 2)
  end

  test "is associated with orders" do
    assert_respond_to valid_order, :items
  end

  test "is associated with items" do
    assert_respond_to valid_item, :orders
  end
end
