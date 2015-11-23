class Item < ActiveRecord::Base
  belongs_to :category
  validates :title, :description, :price , :image, presence: true
  validates :title, uniqueness: true
  has_many :order_items
  has_many :orders, through: :order_items
end
