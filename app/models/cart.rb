class Cart
  attr_reader :contents
  def initialize(raw_data)
    @contents = raw_data || {}
  end

  def add_item(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s] += 1
  end

  def drinks
    contents.map do |item_id, quantity|
      item = Item.find(item_id)
      CartCoffee.new(item, quantity)
    end
  end

  # def count_of(item_id)
  #   contents[item_id.to_s]
  # end
end

class CartCoffee #look into SimpleDelegator
  def initialize(item, quantity)
    @item = item
    @quantity = quantity
  end
end

# @cart.drinks.each do |cart_coffee|
#   cart_coffee.item.name
# end
