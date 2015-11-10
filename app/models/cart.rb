class Cart
  attr_reader :contents
  def initialize(raw_data)
    @contents = raw_data || {}
  end

  def add_items(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s] += 1
  end

  def total

  end

  # def count_of(item_id)
  #   contents[item_id.to_s]
  # end
end
