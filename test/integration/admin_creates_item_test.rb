require 'test_helper'

class AdminCreatesItemTest < ActionDispatch::IntegrationTest

  test 'admin can create an item' do
    logged_in_admin
    category = Category.create(name: "Coffee")

    visit admin_dashboard_index_path

    click_link "Coffee"

    assert new_admin_item_path, current_path

    fill_in('Title', with: 'New Item')
    fill_in('Description', with: 'Rad Description of new item')
    fill_in('Price', with: '3')
    fill_in('Image URL', with: 'www.google.com')
    click_button 'Create Item'

    assert admin_items_path, current_path

    assert page.has_content?("New Item")
    assert page.has_content?("Rad Description of new item")
    assert page.has_content?("$3.00")
    assert page.has_css?('img')
  end
end
