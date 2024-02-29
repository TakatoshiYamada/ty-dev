class List < ApplicationRecord
  # user have many lists
  belongs_to :user
end
