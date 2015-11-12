class Cart
  attr_reader :contents
  def initialize(raw_data)
    @contents = raw_data || {}
  end

  def add_item(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s] += 1
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


  # def count_of(item_id)
  #   contents[item_id.to_s]
  # end
end

class CartCoffee < SimpleDelegator#look into SimpleDelegator
  attr_reader :item, :quantity, :sum
  def initialize(item, quantity, sum)
    super(item)
    @quantity = quantity
    @sum = sum

  end

  def sum_of_price

  end
end


# @cart.drinks.each do |cart_coffee|
#   cart_coffee.item.name
# end
