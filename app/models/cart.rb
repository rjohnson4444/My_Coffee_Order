require_relative 'cart_coffee'
class Cart
  attr_reader :contents
  def initialize(raw_data)
    @contents = raw_data || {}
  end

  def add_item(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s] += 1
  end

  def minus_item(item_id)
    if contents[item_id.to_s] > 0
      contents[item_id.to_s] -= 1
    end
  end

  def sum
    drinks.map {|total|total.sum}.reduce(:+)
  end

  def drinks
    contents.map do |item_id, quantity|
    item = Item.find(item_id)
    sum = item.price * quantity
    CartCoffee.new(item, quantity, sum)
    end
  end
end
