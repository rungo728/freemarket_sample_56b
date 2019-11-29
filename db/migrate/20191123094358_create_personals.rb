class CreatePersonals < ActiveRecord::Migration[5.0]
  def change
    create_table :personals do |t|
      t.references :user,         null: false, foreign_key: true
      t.string :last_name,        null: false
      t.string :first_name,       null: false
      t.string :last_name_kana,   null: false
      t.string :first_name_kana,  null: false
      t.date :birthday,           null: false
      t.string :postcode
      t.references :prefecture,   foreign_key: true
      t.string :city
      t.string :address
      t.string :building
      t.timestamps
    end
  end
end
