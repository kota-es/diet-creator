class Record < ApplicationRecord
  belongs_to :user
  has_many :record_items
  has_many :items, through: :record_items
end
