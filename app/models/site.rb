#  サイト情報を管理するモデル　
class Site < ApplicationRecord
  belongs_to :user

  has_one_attached :hero_image

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 500 }

end
