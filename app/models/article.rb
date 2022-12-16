class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :title, presence: true, length: { maximum: 10 } #presenceは必要なければ削除する。
  validates :content, presence: true #presenceは必要なければこのバリデーションは削除する。
  validate :verify_file_type #画像投稿機能に拡張子を制限する

  private

  def verify_file_type
    return unless image.attached?  # ②

    allowed_file_types = %w[image/jpg image/jpeg image/gif image/png]  # ③
    errors.add(:image, 'only jpg, jpeg, gif, png') unless allowed_file_types.include?(image.blob.content_type)  # ④
  end
end
