require 'test_helper'

class AdminEditsItemTest < ActionDispatch::IntegrationTest

  test 'admin can edit an item' do
    # Background: an existing item
    create_category_and_items(1)
    logged_in_admin
    #       As an admin
    visit admin_items_path
    #       When I visit "admin/items"
    item1 = Item.find_by(title: 'pour over0')
    within "#item#{item1.id}" do
      find_button('Edit Item').click
    end
    #       And I click "Edit"
    #       Then my current path should be "/admin/items/:ITEM_ID/edit"
    assert edit_admin_item_path(item1.id), current_path
    #       And I should be able to upate title, description, image, and status
    fill_in 'Title', with: 'Updated Title'
    fill_in 'Description', with: 'Updated Description'
    fill_in 'Price', with: '3'
    fill_in 'Image', with: 'blankImage.com'
    click_button('Update Item')
    item_to_check = Item.find_by(title: 'Updated Title')
    # within "item#{item_to_check.id}" do
      refute page.has_content?('pour over0')
      assert page.has_content?('Updated Title')
      refute page.has_content?('it taste really good')
      assert page.has_content?('Updated Description')
      # refute page.has_content?('$4.00')
      assert page.has_content?('$3.00')
    #Add assert for image
    # end
  end
end
