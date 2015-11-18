require 'test_helper'

class UnuthenticatedUserTest < ActionDispatch::IntegrationTest
  test 'that an unuthenticated user cannot view registerd user and admin data' do

    visit '/orders'

    assert login_path, current_path

    create_category_and_items(2)
    item1 = Item.find_by(title: "pour over1")
    visit items_path

    within("#item#{item1.id}") do
      find_button("Add to Cart").click
    end
    click_button "View Cart"
    click_button "Checkout"

    assert login_path, current_path

    visit admin_dashboard_index_path
    assert page.has_content?("The page you were looking for doesn't exist")
  end 
end
