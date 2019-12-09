class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :image, ImageUploader

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  validates :name, presence: true 
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { in: 7..128 }, format: { with: VALID_PASSWORD_REGEX }, confirmation: true, on: :create  
  validates :password, presence: true, length: { in: 7..128 }, format: { with: VALID_PASSWORD_REGEX }, confirmation: true, on: :update, allow_blank: true
  validates :password_confirmation, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :update, allow_blank: true
  validates :gender, presence: true
  validates :height, presence: true
  validates :weight, presence: true
  validates :pal, presence: true
  validates :birthday, presence: true

  has_many :items
  has_many :reviews, dependent: :destroy
  has_many :lists, dependent: :destroy
  has_one :record, dependent: :destroy
  
  def gender_kana
    self.gender == "male" ? "男性" : "女性"
  end

  def age
    today = Date.today
    age = today.year - self.birthday.year
    if today.month < birthday.month or (today.month == birthday.month && today.day < birthday.day)
      return age -= 1
    else
      return age
    end
  end

  def day_kcal
    gender_num = self.gender == "male" ? 0.4325 : 0.9708
    day_kcal = ((0.0481 * self.weight + 0.0234 * self.height - 0.0138 * age - gender_num ) * 1000 / 4.186 * self.pal).round
    return day_kcal
  end

  def day_protein
   ((self.day_kcal * 0.165) / 4).round(1)
  end

  def day_fat
    if self.age <= 29
      return((self.day_kcal * 0.25) / 9).round(1)
    else
      return((self.day_kcal * 0.225) / 9).round(1)
    end
  end

  def day_carb
    ((self.day_kcal * 0.6) / 4).round(1)
  end

  def day_salt
    self.gender == "male" ? 8.0 : 7.0
  end

  def today_records
    self.record.record_items.where(created_at: Time.zone.now.all_day)
  end

  def today_kcal  
    kcal = 0
    today_records.each do |record|
      kcal += record.item.kcal
    end
    return kcal
  end

  def today_protein 
    protein = 0
    today_records.each do |record|
      protein += record.item.protein
    end
    return protein
  end

  def today_fat
    fat = 0
    today_records.each do |record|
      fat += record.item.fat
    end
    return fat
  end

  def today_carb 
    carb = 0
    today_records.each do |record|
      carb += record.item.carb
    end
    return carb
  end

  def today_salt
    salt = 0
    today_records.each do |record|
      salt += record.item.salt
    end
    return salt
  end

  def balance_kcal
    self.day_kcal - self.today_kcal
  end

  def balance_protein
    self.day_protein - self.today_protein
  end

  def balance_fat
    self.day_fat - self.today_fat
  end

  def balance_carb
    self.day_carb - self.today_carb
  end

  def balance_salt
    self.day_salt - self.today_salt
  end

end