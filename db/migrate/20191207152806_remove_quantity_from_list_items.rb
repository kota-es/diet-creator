class RemoveQuantityFromListItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :list_items, :quantity, :integer
  end
end
