require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  def valid_order_item
    OrderItem.new(order_id: 1, item_id: 2, quantity: 2, subtotal: 1)
  end

  test "is valid" do
    assert valid_order_item.valid?
  end

  test "is invalid without order_id" do
    order_item = valid_order_item
    order_item.order_id = nil

    refute order_item.valid?
  end

  test "is invalid without item_id" do
    order_item = valid_order_item
    order_item.item_id = nil

    refute order_item.valid?
  end

  test "is associated with orders" do
    assert_respond_to valid_order_item, :order
  end

  test "is associated with items" do
    assert_respond_to valid_order_item, :item
  end
end
