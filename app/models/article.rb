class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :title, length: { maximum: 10 }
end
