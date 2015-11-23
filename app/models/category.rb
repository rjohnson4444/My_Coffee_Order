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

  def self.get_categories
    self.all.map { |category| [category.name, category.id] }
  end
end
