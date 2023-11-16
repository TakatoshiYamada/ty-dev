class Article < ApplicationRecord
  belongs_to :blog
  belongs_to :category, optional: true

  # バリデーションを追加
  validates :title, presence: true
  validates :content, presence: true

  # 画像のアップロードにActiveStorageを使用する場合
  has_one_attached :image
end
