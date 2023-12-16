class Blog < ApplicationRecord
  belongs_to :user
  has_many :articles, dependent: :destroy
  has_one_attached :header_image

  # 名前の存在と長さの確認
  validates :name, presence: true, length: { minimum: 2, maximum: 100 }

  # 説明の存在と長さの確認
  validates :description, presence: true, length: { minimum: 10 }

  # ユーザーIDの存在確認（ユーザーとの関連付けが必要な場合）
  validates :user_id, presence: true
end
