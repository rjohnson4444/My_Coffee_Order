require 'test_helper'

class RegUserCanViewPastOrderTest < ActionDispatch::IntegrationTest

  # Background: An existing user that has one previous order

  test 'a registered user can view past orders' do
    #
    # create_user
    # visit order_path
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
