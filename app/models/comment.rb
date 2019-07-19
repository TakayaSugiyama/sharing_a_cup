class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :comment_favorites, dependent: :destroy
  # バリデーション
end
