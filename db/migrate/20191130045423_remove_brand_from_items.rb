class RemoveBrandFromItems < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :items, :brands
    remove_reference :items, :brand, index: true
  end
end
