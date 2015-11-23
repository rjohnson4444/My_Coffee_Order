require 'test_helper'

class VistorCanViewItemsTest < ActionDispatch::IntegrationTest

  def create_items(num)
    num.times do |i|
      Item.create(title: "latte#{i}", description: 'forthy deliciousness', price: 4.00, image: "google.com")
    end
  end

  test 'an unregistered user can view items' do
    create_items(3)
    visit items_path

    within ".titlelatte0" do
      assert page.has_content?('latte0')
    end

    within ".titlelatte1" do
      assert page.has_content?('latte1')
    end

    within ".titlelatte2" do
      assert page.has_content?('latte2')
    end
  end
end
