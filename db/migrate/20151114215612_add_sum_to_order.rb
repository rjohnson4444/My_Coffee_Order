class AddSumToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :sum, :integer
  end
end
