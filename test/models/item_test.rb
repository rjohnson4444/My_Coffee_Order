require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  def valid_item
    Item.new(title: "Hot Coffee", description: "ground heaven", price: 2, image: "http://i.dailymail.co.uk/i/pix/2013/10/24/article-0-16B39191000005DC-568_634x403.jpg")
  end

  test 'is valid' do
    assert valid_item.valid?
  end

  test 'is invalid without a title description price or image' do
    no_data_item = Item.new(title: "", description: "", price: "", image: "")

    refute no_data_item.valid?
  end
end
