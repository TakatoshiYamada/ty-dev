class Blog < ApplicationRecord
  belongs_to :user
  has_many :articles, dependent: :destroy

  has_one_attached :header_image
end
