require 'test_helper'


class RegUserCanViewPastOrderTest < ActionDispatch::IntegrationTest

  test 'a registered user can view past orders' do

    user = create_user
    create_category_and_items(1)
    add_2_items

    item1 = Item.find_by(title: "pour over0")
    item2 = Item.find_by(title: "drip0")

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

    assert page.has_content?("#{Order.last.created_at.strftime("%b. %d, %Y")}")
    end
end
