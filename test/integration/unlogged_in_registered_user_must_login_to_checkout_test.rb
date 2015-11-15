require 'test_helper'

class UnloggedInRegisteredUserMustLoginToCheckoutTest < ActionDispatch::IntegrationTest

  test 'that an a registered user must log in to checkout' do
    create_category_and_items(1)
    create_user
    visit items_path
    item1 = Item.find_by(title: "pour over0")

    within "#item#{item1.id}" do
      click_button "Add to Cart"
    end

    visit "/cart"
    click_button "Checkout"
    assert "/login", current_path

    assert page.has_content?("Must Login")
     fill_in 'Username', with: 'ryan'
     fill_in "Password", with: 'waffles'
     click_button "Login"

     click_link "Cart"
     assert 0, Order.all.count
     click_button "Checkout"
     assert 1, Order.all.count
     assert '/orders', current_path
     assert page.has_content?("Order was succefully placed")

     # find items by querying current_user.orders.last and shovel @cart.drinks in cart at the time

        # And I should see the order I just placed in a table
  end
end
