class RemoveCategoryIdFromBrands < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :brands, :categories
    remove_index :brands, :category_id
    remove_reference :brands, :category
  end
end
