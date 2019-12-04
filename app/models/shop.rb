class Shop < ApplicationRecord
  has_many :item_shops
  has_many :items, through: :item_shops
end
