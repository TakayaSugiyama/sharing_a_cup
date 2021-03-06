class Post < ApplicationRecord
    belongs_to :user
    has_many :favorites,dependent: :destroy
    has_many :images, dependent: :destroy
    has_many :comments,dependent: :destroy
    has_many :comment_favorites,dependent: :destroy
    accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true
    #バリデーション
    validates :product_name ,presence: true,length:{maximum:25}
    validates :title, presence:true,length:{maximum:30}
    validates :price, presence: true,numericality: :only_integer,length:{maximum:10}
    validates :review, length:{maximum:500},presence: true
end
