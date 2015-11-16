class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items

  def add_items_to_order(cart, current_user)
    cart.contents.each do |item_id, quantity|
      OrderItem.create(order_id: self.id, item_id: item_id.to_i, quantity: quantity)
    end
  end

 def quantity_of_item(item_id)
  self.order_items.find_by(item_id: item_id).quantity
 end

end
