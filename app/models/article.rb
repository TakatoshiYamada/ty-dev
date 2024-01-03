class Article < ApplicationRecord
  belongs_to :blog
  belongs_to :category, optional: true
  # 画像のアップロードにActiveStorageを使用する
  has_one_attached :thumbnail
  has_many_attached :images

  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :content, presence: true
  validates :blog_id, presence: true

  # カスタムバリデーション追加
  validate :validate_thumbnail
  validate :validate_images

  private

  def validate_thumbnail
    # 画像のバリデーションロジック（例：サイズ制限、フォーマット制限）
    if thumbnail.attached?
      unless acceptable_types.include?(thumbnail.content_type)
        errors.add(:thumbnail, 'must be a JPEG or PNG')
      end
    end

    # 画像サイズに関するバリデーションもここに追加できます。
    # 例: if thumbnail.blob.byte_size > 1.megabyte

  end

  def validate_images
    images.each do |image|
      unless acceptable_types.include?(image.content_type)
        errors.add(:images, 'must be a JPEG or PNG')
      end
      # サイズ制限のバリデーションをここに追加（オプション）
    end
  end

  def acceptable_types
    ['image/jpeg', 'image/png']
  end
end
