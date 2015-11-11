require 'test_helper'

class UnregisteredUserCanAddItemsToCartTest < ActionDispatch::IntegrationTest

  # Background: Items, and a user that is not logged in
  test 'unregistered user can add items to cart' do
    create_category_and_items(2)
    item1 = Item.find_by(title: "pour over1")
    visit items_path
    within("#item#{item1.id}") do
      find_button("Add to Cart").click
    end
    item2 = Item.find_by(title: "drip1")
    visit items_path
    within("#item#{item2.id}") do
      find_button("Add to Cart").click
    end

    click_button "View Cart"
    # And my current path should be "/cart"
    assert cart_items_path, current_path
    # And I should see a sm all image, title, description and price for the item I just added
    assert page.has_content?("pour over")
    assert page.has_content?("it taste really good")
    assert page.has_content?("$4.00")
    assert page.has_css?("img")
    # And there should be a "total" price for the cart that should be the sum of all items in the cart
    assert page.has_content?("$8.00")
  end
end
