VALID_CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]

class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :category, presence: true, inclusion: { in: VALID_CATEGORIES }
  validates :name, :address, :category, presence: true
end
