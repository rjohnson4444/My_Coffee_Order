class OrderValidator
  def self.validate(order, cart, current_user)
    if order.save
      order.add_items_to_order(cart, current_user)
      order.ordered!
      cart.contents.clear
    else
      false
    end
  end
end
