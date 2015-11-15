require 'test_helper'

class RegisteredUserCanViewPastOrdersTest < ActionDispatch::IntegrationTest
  test "user can create an order" do
    skip
    user = create_user
    create_category_and_items(1)
    item1 = Item.first

    visit login_path

    fill_in "Username", with: "ryan"
    fill_in "Password", with: "waffles"
    click_button "Login"

    click_link "Menu"


    within "#item#{item1.id}" do
      click_button "Add to Cart"
    end

    click_button "View Cart"
    click_button "Checkout"
    assert order_path(user), current_path
    assert page.has_content?("Order Total")

  end

  test "user can view previous orders" do

    user = create_user
    create_category_and_items(1)
    item1 = Item.first

    visit login_path

    fill_in "Username", with: "ryan"
    fill_in "Password", with: "waffles"
    click_button "Login"

    order = user.orders.create(quantity: 5, sum: 20)
    visit orders_path
# 
    assert page.has_content?("Order number:#{order.id}")

    assert page.has_content?("Order total: $20.00")
    assert page.has_content?("Order quantity: 5")

  end
end
