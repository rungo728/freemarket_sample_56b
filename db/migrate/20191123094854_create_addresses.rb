class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :user,         null: false, foreign_key: true
      t.string :last_name,        null: false
      t.string :first_name,       null: false
      t.string :last_name_kana,   null: false
      t.string :first_name_kana,  null: false
      t.string :postcode,         null: false
      t.references :prefecture,   null: false, foreign_key: true
      t.string :city,             null: false
      t.string :address,          null: false
      t.string :building
      t.string :phone_number_sub
      t.timestamps
    end
  end
end