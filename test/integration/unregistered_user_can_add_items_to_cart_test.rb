require 'test_helper'

class UnregisteredUserCanAddItemsToCartTest < ActionDispatch::IntegrationTest

  # Background: Items, and a user that is not logged in
  test 'unregistered user can add items to cart' do
    create_category_and_items(2)
    item = Item.find_by(title: "pour over2")
    # As a visitor
    visit items_path
    within("#item#{item.id}") do
      find_button("Add to Cart").click
    end
    # When I visit any page with an item on it
    # I should see a link or button for "Add to Cart"
    # When I click "Add to cart" for that item
    # And I click a link or button to view cart
    click_button "View Cart"
    # And my current path should be "/cart"
    assert cart_path, current_path
    # And I should see a small image, title, description and price for the item I just added
    assert page.has_content?("pour over", "it taste really good", 4.00)
    assert page.has_css?("img")
    # And there should be a "total" price for the cart that should be the sum of all items in the cart
    assert page.has_content?(8.00)
  end
end