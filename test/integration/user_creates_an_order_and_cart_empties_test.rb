require 'test_helper'

class UserCreatesAnOrderAndCartEmptiesTest < ActionDispatch::IntegrationTest
  test "cart empties after every created order" do
    create_category_and_items(1)
    item1 = Item.find_by_title("pour over0")
    logged_in_user
    visit items_path

    within "#item#{item1.id}" do
      click_button "Add to Cart"
    end

    click_button "View Cart"
    click_button "Checkout"

    click_link "Cart"

    assert 1, Order.all.count
    refute page.has_content?("pour over0")
  end
end
