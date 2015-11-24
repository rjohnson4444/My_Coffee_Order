require 'test_helper'

class AdminViewsItemsTest < ActionDispatch::IntegrationTest
  test 'admin can view items' do
    create_category_and_items(1)
    logged_in_admin

    visit '/admin/dashboard'

    assert admin_dashboard_index_path, current_path

    click_link('View items')

    assert '/admin/items', current_path

    assert page.has_content?('pour over0')
    assert page.has_content?('it taste really good')

    item1 = Item.find_by(title: "pour over0")

    within "#item#{item1.id}" do
      find_button('Edit').click
    end
  end
end
