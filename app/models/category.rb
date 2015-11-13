class Category < ActiveRecord::Base
  has_many :items
  validates :name, presence: true
  before_save :set_slug

  def to_param
    slug
  end

  def set_slug
    self.slug = name.parameterize
  end
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
