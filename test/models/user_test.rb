require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def valid_attribute
    User.create(username: "user", password: "pw", address: "1111 Maple Rd", city: "Denver", state: "CO", zip: 82020)
  end

  test "is valid" do
    user = valid_attribute

    assert user.valid?
  end

  test "is not valid without username" do
    user = User.create(username: "", password: "pw", address: "1111 Maple Rd", city: "Denver", state: "CO", zip: 82020)

    refute user.valid?
  end

  test "is not valid without password" do
    user = User.create(username: "user", password: "", address: "1111 Maple Rd", city: "Denver", state: "CO", zip: 82020)

    refute user.valid?
  end

  test "is not valid without address" do
    user = User.create(username: "user", password: "pw", address: "", city: "Denver", state: "CO", zip: 82020)

    refute user.valid?
  end

  test "is not valid without city" do
    user = User.create(username: "user", password: "pw", address: "1111 Maple Rd", city: "", state: "CO", zip: 82020)

    refute user.valid?
  end

  test "is not valid without state" do
    user = User.create(username: "user", password: "pw", address: "1111 Maple Rd", city: "Denver", state: "", zip: 82020)

    refute user.valid?
  end

  test "is not valid without zipcode" do
    user = User.create(username: "user", password: "pw", address: "1111 Maple Rd", city: "Denver", state: "CO", zip: "")

    refute user.valid?
  end
end
