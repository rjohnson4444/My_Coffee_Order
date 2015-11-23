class OrderValidator
  def self.validate(order, cart, current_user)    
    if order.save && current_user
      current_user.orders << order
      order.add_items_to_order(cart, current_user)
      order.ordered!
      cart.contents.clear
    end
  end
end
