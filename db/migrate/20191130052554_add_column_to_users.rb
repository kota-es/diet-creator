class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.string  :gender,           null: false
      t.decimal :height,           null: false, precision: 4, scale: 1 
      t.decimal :weight,           null: false, precision: 4, scale: 1 
      t.decimal :pal,              null: false, precision: 3, scale: 2
      t.date    :birthday,         null: false
    end
  end
end
