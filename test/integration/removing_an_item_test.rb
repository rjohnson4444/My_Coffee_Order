require 'test_helper'

class RemovingAnItemTest < ActionDispatch::IntegrationTest
   test "an unregistered user can delete an item from the cart" do
     create_category_and_items(2)
     item1 = Item.find_by(title: "pour over1")
     visit items_path

     within("#item#{item1.id}") do
       find_button("Add to Cart").click
     end
     click_button "View Cart"
     assert page.has_content?("$4.00")
     assert page.has_content?("quantity:1")
     click_link "Remove"
     assert page.has_content?("Successfully removed pour over1 from your cart")
   end
end
