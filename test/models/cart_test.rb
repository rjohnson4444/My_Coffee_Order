class CartTest < ActiveSupport::TestCase
  test 'cart has initial contents' do
    cart = Cart.new({ "1" => 1})

    assert_equal({ "1" => 1}, cart.contents)
  end

  test 'can add an item' do
    cart = Cart.new({ "1" => 1})

    cart.add_item(1)
    cart.add_item(2)

    assert_equal({ "1" => 2, "2" => 1}, cart.contents)
  end

end
