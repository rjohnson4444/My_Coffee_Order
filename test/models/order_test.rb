require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  def valid_attributes
    Order.new(user_id: 1, sum: 4, quantity: 2, status: 0)
  end

  test "is valid" do
    order = valid_attributes

    assert order.valid?
  end

  test "is invalid without user id" do
    order = valid_attributes
    order.user_id = nil

    refute order.valid?
  end
end
