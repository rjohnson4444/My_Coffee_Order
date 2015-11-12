class Category < ActiveRecord::Base
  has_many :items
  validates :name, presence: true

  # #first way
  # def to_param
  #   "#{id} #{name}".parameterize
  # end
  #
  # # second way
  # extend FriendlyId
  # friendly_id :name
  #
  # # third way
  # extend FriendlyId
  # friendly_id :name, use: :slugged

end
