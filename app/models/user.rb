class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # user have one site
  has_one :site
  # user have many social_links
  has_many :social_links, dependent: :destroy
  # user have many list
  has_many :lists
  # user have many blogs
  has_many :blogs
  # user have one avatar_image
  has_one_attached :avatar

  # メールアドレスの存在とフォーマットの確認
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  # 名前の存在を確認
  validates :name, presence: true

  # 管理者フラグの存在を確認（必須ではない場合は不要）
  validates :admin, inclusion: { in: [true, false] }

end
