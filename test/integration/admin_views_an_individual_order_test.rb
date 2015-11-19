require 'test_helper'

class AdminViewsAnIndividualOrderTest < ActionDispatch::IntegrationTest


  test "admin can visit an individual order page" do
    admin = logged_in_admin
    user = user_makes_an_order
    user.orders.last.ordered!
    order = user.orders.last
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
      assert page.has_content?("Purchaser's Address: #{order.user.address}")
      assert page.has_content?("#{order.user.city}")
      assert page.has_content?("#{order.user.state}")
      assert page.has_content?("#{order.user.zip}")
    end

    within "#order-item#{item.id}-title" do
      assert page.has_content?("#{item.title.capitalize}")
    end

    within "#order-item#{item.id}-quantity" do
      assert page.has_content?("Quantity: #{item_quantity}")
    end

    within "#order-item#{item.id}-price" do
      assert page.has_content?("Price: $#{item.price}.00")
    end

    within "#order-item#{item.id}-subtotal" do
      assert page.has_content?("Subtotal: $#{item_subtotal}.00")
    end

    assert page.has_content?("Order Total Price: $4.00")

    assert page.has_content?("Order Status: ordered")
  end
end
