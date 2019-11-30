class AddBrandToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :brand, :string
  end
end
