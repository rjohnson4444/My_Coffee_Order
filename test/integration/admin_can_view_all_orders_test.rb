require 'test_helper'

class AdminCanViewAllOrdersTest < ActionDispatch::IntegrationTest
  test 'as an admin I can view all orders from users.' do
    logged_in_admin

    user = create_user
    create_category_and_items(1)
    item1 = Item.find_by(title: "pour over0")

    visit items_path

    within "#item#{item1.id}" do
      click_button "Add to Cart"
    end

    click_button "View Cart"
    click_button "Checkout"

    visit admin_dashboard_index_path

    within(".collapsible-header") do
      assert page.has_content?("Order number: #{Order.last.id}")
    end

    find_link("Order number: #{Order.last.id}").visible?

  end

    #   And I can see the total number of orders for each status ("Ordered", "Paid", "Cancelled", "Completed")
    #   And I can filter orders to display by each status type  ("Ordered", "Paid", "Cancelled", "Completed")
end
