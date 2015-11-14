class Item < ActiveRecord::Base
  belongs_to :category
  validates :title, :description, :price, :image, presence: true
  has_many :order_items
  has_many :orders, through: :order_items

  # #first way
  # def to_param
  #   binding.pr
  #   "#{id} #{title}".parameterize
  # end
  # second way
  # extend FriendlyId
  # friendly_id :title

  # # third way with slug
  # extend FriendlyId
  # friendly_id :title, use: :slugged

end
