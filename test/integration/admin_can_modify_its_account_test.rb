require 'test_helper'

class AdminCanModifyItsAccountTest < ActionDispatch::IntegrationTest
  test "admin can only edit its account information " do

   logged_in_admin

   click_link "Edit Account"

   fill_in "Username", with: "Jhun"
   fill_in "Password", with: "dana"

   click_button "submit"
   assert page.has_content?("You have succesfully changed your account information")


   assert admin_dashboard_index_path , current_path
   end

   test "registered user cannot edit user info" do
     user = User.create(username: "user", password: "password", address: "1111 Maple Rd", city: "Denver", state: "CO", zip: 82020)
     visit '/login'
     fill_in "Username", with: "user"
     fill_in "Password", with: "password"
     click_button "Login"
     visit edit_user_path(user)
     assert page.has_content?("You must be an admin to edit")
     assert "/", current_path
   end

end
