class SorceryCore < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string  :name,             null: false
      t.string  :email,            null: false
      t.string  :crypted_password, null: false
      t.string  :salt
      t.string  :image
      # t.string  :gender,           null: false
      # t.integer :height,           null: false
      # t.decimal :weight,           null: false, precision: 4, scale: 1 
      # t.decimal :pal,              null: false, precision: 3, scale: 2
      # t.date    :birthday,         nill: false
      t.timestamps                 null: false
    end

    add_index :users, :email, unique: true
  end
end
