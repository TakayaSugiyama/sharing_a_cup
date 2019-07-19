class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :comment_favorites, dependent: :destroy
  # バリデーション
  validates :title, presence: true
  validates :comment,presence: true,length: {maximum: 200}
end
