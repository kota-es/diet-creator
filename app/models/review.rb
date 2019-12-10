class Review < ApplicationRecord
  validates :comment, presence: true
  
  belongs_to :item
  belongs_to :user

  def taste_rate
    "😋" * self.taste 
  end

  def volume_rate
    "🍖" * self.volume
  end

end
