require 'test_helper'

class RegUserCanViewPastOrderTest < ActionDispatch::IntegrationTest

  # Background: An existing user that has one previous order

  test 'a registered user can view past orders' do

    user = create_user
    create_category_and_items(1)
    item1 = Item.find_by(title: "pour over0")
    order = user.orders.create(sum: 4, quantity: 1)
    visit items_path
    within "#item#{item1.id}" do
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

    click_link "Logout"
    click_link "Login"

    fill_in 'Username', with: 'ryan'
    fill_in "Password", with: 'waffles'
    click_button "Login"

    visit order_path(user.orders.last)
    assert page.has_content?("pour over0")
    #   As an authenticated user
    #   When I visit "/orders"
    #   Then I should see my past order
    #   And I should see a link to view that order
    #   And when I click that link
    #   Then I should see each item that was order with the quantity and line-item subtotals
    #   And I should see links to each item's show page
    #   And I should see the current status of the order (ordered, paid, cancelled, completed)
    #   And I should see the total price for the order
    #   And I should see the date/time that the order was submitted
    #   If the order was completed or cancelled
    #   Then I should see a timestamp when the action took place
    #   And if any of the items in the order were retired from the menu
    #   Then they should still be able to access the item page
    #   But they should not be able to add the item to their cart
    end
end
