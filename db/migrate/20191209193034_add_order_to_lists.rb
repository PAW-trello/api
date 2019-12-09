class AddOrderToLists < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :display_order, :integer
  end
end
