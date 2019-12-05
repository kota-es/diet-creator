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
  has_many :shops, through: :item_shops
  belongs_to :user

  def shop_name
    if self.shops.length > 1
      "#{self.shops.length}店舗で販売"
    else
      self.shops.first.name
    end
  end

  # enum shop_id: { 'セブン-イレブン': 1, 'ファミリーマート': 2, 'ローソン': 3, 
  #                 'ミニストップ': 4, 'デイリーヤマザキ': 5, 'セイコーマート': 6,
  #                 'NewDays': 7, 'ポプラ': 8, 'まいばすけっと': 9,
  #                 'ローソン100': 10, 'ナチュラルローソン': 11, 'ローソンスリーエフ': 12 
  #               }

  # enum genre_id: { 'おにぎり': 1, 'お寿司': 2, 'お弁当': 3, 
  #                 'そば・うどん': 4, '中華麺・その他麺': 5, 'スパゲティ・パスタ': 6,
  #                 'グラタン・ドリア': 7, 'サンドイッチ・ロールパン': 8, 'ハンバーガー': 9,
  #                 '惣菜パン・菓子パン': 10, 'おかず・おつまみ': 11, 'サラダ': 12, 
  #                 'スナック菓子・チョコ': 13, 'コンビニスイーツ': 14, 'アイス・氷菓': 15,
  #                 'ホットスナック': 16, '中華まん': 17, 'おでん': 18,
  #                 '飲み物': 19, 'お酒': 20, 'コンビニコーヒー': 21,
  #                 'カップ麺': 22, '冷凍食品': 23, 'その他': 24
  #               }

end
