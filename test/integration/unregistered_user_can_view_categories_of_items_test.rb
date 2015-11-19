require 'test_helper'

class UnregisteredUserCanViewCategoriesOfItemsTest < ActionDispatch::IntegrationTest

  test ' user can view categories linked ' do

    category_two = Category.create(name:'latte')
    category_two.items.create(title: "Chai Tea",      description: 'forthy deliciousness',       price: 4.00, image: "google.com")
    category_two.items.create(title: "Cappuccino", description: 'super forthy deliciousness', price: 4.00, image: "google.com")

    visit category_path(category_two.name)

    assert page.has_content?("Chai Tea")
  end

  test 'user can view categories index page and click on category' do
    category_one = Category.create(name:'coffee')
    category_one.items.create(title: "pour over", description: 'it taste really good', price: 4.00, image: "google.com")
    category_one.items.create(title: "drip",      description: 'it taste good',         price: 4.00, image: "google.com")

    visit categories_path

    within("#category#{category_one.id}") do
      assert page.has_content?("coffee")
      click_link("coffee")
    end

    assert page.has_content?("pour over")
  end
end
