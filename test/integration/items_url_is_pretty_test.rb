require 'test_helper'

class ItemsUrlIsPrettyTest < ActionDispatch::IntegrationTest
  test "specific item name has matching url" do
    create_category_and_items(1)
    item = Item.find_by(title: "pour over0")

    visit items_path

    click_link "pour over0"

    assert "/items/#{item.slug.parameterize}", current_path
  end
end
