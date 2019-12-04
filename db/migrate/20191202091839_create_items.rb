class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.string :image
      t.integer :price, null: false
      t.integer :kcal, null: false
      t.decimal :protein, null: false, precision: 3, scale: 1
      t.decimal :fat, null: false, precision: 3, scale: 1
      t.decimal :carb, null: false, precision: 3, scale: 1
      t.decimal :salt, null: false, precision: 3, scale: 1
      t.string :note
      t.references :genre, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end
