require 'test_helper'

class RegisteredUserCanViewPastOrdersTest < ActionDispatch::IntegrationTest
  test "user can create an order" do
    user = user_makes_an_order
    item1 = Item.first

    assert order_path(user), current_path

    assert page.has_content?("Order number: #{user.orders.last.id}")
    assert page.has_content?("Order Quantity: 1")
    assert page.has_content?("Order Total: $4.00")
  end

  test "user can view previous orders" do
    user = logged_in_user
    create_category_and_items(1)
    item1 = Item.first

    order = user.orders.create(quantity: 5, sum: 20)
    visit orders_path
#
    assert page.has_content?("Order number: #{order.id}")

    assert page.has_content?("Order Total: $20.00")
    assert page.has_content?("Order Quantity: 5")
  end
end
