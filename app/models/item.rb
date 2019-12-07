class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :price, presence: true
  validates :kcal, presence: true
  validates :protein, presence: true
  validates :fat, presence: true
  validates :carb, presence: true
  validates :salt, presence: true
  validates :genre_id, presence: true
  validates :user_id, presence: true

  belongs_to_active_hash :genre
  has_many :item_shops
  has_many :shops, through: :item_shops ,dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :lists
  belongs_to :user

  def shop_name
    if self.shops.length > 1
      "#{self.shops.length}店舗で販売"
    else
      self.shops.first.name
    end
  end

end
