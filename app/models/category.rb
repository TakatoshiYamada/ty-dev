class Category < ApplicationRecord
  has_many :articles

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 100 }


end
