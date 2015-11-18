require 'test_helper'

class VistorCanViewItemsTest < ActionDispatch::IntegrationTest

  def create_items(num)
    num.times do
    Item.create(title: "latte", description: 'forthy deliciousness', price: 4.00, image: "google.com")
    end
  end

  test 'an unregistered user can view items' do
    create_items(3)
    visit items_path

    # adding within css not working
    assert page.has_content?('Latte')
  end
end
