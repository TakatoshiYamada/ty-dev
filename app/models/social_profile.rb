class SocialProfile < ApplicationRecord
  belongs_to :user

  # ユーザーIDの存在を確認
  validates :user_id, presence: true

  # 名前の存在と長さを確認
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }

  # URLの存在とフォーマットを確認
  validates :url, presence: true, format: URI::regexp(%w[http https])

end
