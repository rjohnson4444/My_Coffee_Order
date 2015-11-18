require 'test_helper'


class RegUserCanViewPastOrderTest < ActionDispatch::IntegrationTest

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

    visit orders_path

    assert page.has_content?("$8.00")

    click_link "Order number: #{order1.id}"

    assert order_path(order1), current_path

    within "#order_id" do
      assert page.has_content?(order1.id)
    end

    within "#item-title#{item1.id}" do
      assert page.has_content?("pour over0")
    end

    within "#item-quantity#{item1.id}" do
      assert page.has_content?("Quantity: 1")
    end

    within "#item-price#{item1.id}" do
      assert page.has_content?("Price: $4.00")
    end

    within "#item-title#{item2.id}" do
      assert page.has_content?("drip0")
    end

    within "#item-quantity#{item2.id}" do
      assert page.has_content?("Quantity: 1")
    end

    within "#item-price#{item2.id}" do
      assert page.has_content?("Price: $4.00")
    end

    assert page.has_content?('$8.00')
    assert page.has_content?("Total Quantity: 2")
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
