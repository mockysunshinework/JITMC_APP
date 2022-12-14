class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :title, length: { maximum: 10 }
  validate :verify_file_type

  private

  def verify_file_type
    return unless image.attached?  # ②

    allowed_file_types = %w[image/jpg image/jpeg image/gif image/png]  # ③
    errors.add(:image, 'only jpg, jpeg, gif, png') unless allowed_file_types.include?(image.blob.content_type)  # ④
  end
end
