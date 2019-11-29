class RemoveDetailsFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :last_name, :string
    remove_column :users, :first_name, :string
    remove_column :users, :last_name_kana, :string
    remove_column :users, :first_name_kana, :string
    remove_column :users, :birthday, :date
    remove_column :users, :phone_number, :string
    remove_column :users, :postcode, :string
    remove_reference :users, :prefecture, foreign_key: true
    remove_column :users, :city, :string
    remove_column :users, :address, :string
    remove_column :users, :building, :string
    remove_column :users, :phone_number_sub, :string
  end
end
