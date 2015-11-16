require 'test_helper'


class RegUserCanViewPastOrderTest < ActionDispatch::IntegrationTest

  # Background: An existing user that has one previous order

  test 'a registered user can view past orders' do

    user = create_user
    create_category_and_items(1)
    item1 = Item.find_by(title: "pour over0")
    item2 = Item.find_by(title: "drip0")

    visit items_path
    within "#item#{item1.id}" do
      click_button "Add to Cart"
    end

    within "#item#{item2.id}" do
      click_button "Add to Cart"
    end

    click_button "View Cart"
    click_button "Checkout"
    fill_in 'Username', with: 'ryan'
    fill_in "Password", with: 'waffles'
    click_button "Login"

    assert '/dashboard', current_path

    click_link "Cart"
    click_button "Checkout"

    order1 = user.orders.last

    click_link "Logout"
    click_link "Login"

    fill_in 'Username', with: 'ryan'
    fill_in "Password", with: 'waffles'
    click_button "Login"

    visit orders_path

    assert page.has_content?("$8.00")

    click_link "Order number:#{order1.id}"

    assert order_path(order1), current_path

    assert page.has_content?('pour over0')
    assert page.has_content?('drip0')
    assert page.has_content?("$4.00")
    assert page.has_content?('$4.00')
    assert page.has_content?('$8.00')

    assert page.has_content?("pour over0's quantity:1")
    assert page.has_content?("drip0's quantity:1")
    assert page.has_content?("total quantity: 2")
    find_link('pour over0').visible?
    assert page.has_content?("ordered")

    #   And I should see the date/time that the order was submitted
    assert page.has_content?("#{Order.last.created_at.strftime("%d %b. %Y")}")

    #   If the order was completed or cancelled
    #   Then I should see a timestamp when the action took place
    #   And if any of the items in the order were retired from the menu
    #   Then they should still be able to access the item page
    #   But they should not be able to add the item to their cart
    end
end
