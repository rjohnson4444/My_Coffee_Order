require 'test_helper'

class AdminViewsAnIndividualOrderTest < ActionDispatch::IntegrationTest


  test "admin can visit an individual order page" do
    skip
    admin = logged_in_admin
    user_makes_an_order
    order = Order.last
    item = order.items.first
    item_quantity = order.order_items.first.quantity
    item_subtotal = order.order_items.first.quantity * item.price
    date = order.created_at.strftime("%b. %d %Y")

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit admin_orders_path

    assert page.has_content?("All Orders")

    within "#orders" do
      click_link "Order number: #{order.id}"
    end

    assert admin_order_path(order), current_path

    assert page.has_content?("Order Date: #{date}")

    assert page.has_content?("Purchaser's Name: #{order.user.username.capitalize}")

    within "#user-address" do
      assert page.has_content?("Purchaser Address: #{order.user.address}")
      assert page.has_content?("#{order.user.city}")
      assert page.has_content?("#{order.user.state}")
      assert page.has_content?("#{order.user.zipcode}")
    end

    within "#order-item#{item.id}" do
      assert page.has_content?("#{item.title.capitalize}")
      assert page.has_content?("Quantity: #{item_quantity}")
      assert page.has_content?("Price: #{item.price}")
      assert page.has_content?("Subtotal: #{item_subtotal}")
    end

    assert page.has_content?("$4.00")
    assert page.has_content?("ordered")

    # And I can see, for each item on the order:
    #   - The item's name, which is linked to the item page.
    #   - Quantity in this order.
    #   - Price
    #   - Line item subtotal.
    # And I can see the total for the order.
    # And I can see the status for the order.
  end
end
