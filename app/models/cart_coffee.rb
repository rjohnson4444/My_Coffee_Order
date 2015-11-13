class CartCoffee < SimpleDelegator
  attr_reader :item, :quantity, :sum
  def initialize(item, quantity, sum)
    super(item)
    @quantity = quantity
    @sum = sum
  end
end
