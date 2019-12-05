class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :image, ImageUploader

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i

  validates :name, presence: true 
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { in: 7..128 }, format: { with: VALID_PASSWORD_REGEX }, confirmation: true  
  validates :password_confirmation, presence: true
  validates :gender, presence: true
  validates :height, presence: true
  validates :weight, presence: true
  validates :pal, presence: true
  validates :birthday, presence: true

  has_many :items
  has_many :reviews
  
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
    case self.gender
    when "male" 
      8.0
    when "female"
      7.0
    end
  end

end