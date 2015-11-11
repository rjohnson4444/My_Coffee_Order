class Item < ActiveRecord::Base
  belongs_to :category
  validates :title, :description, :price, :image, presence: true
end
