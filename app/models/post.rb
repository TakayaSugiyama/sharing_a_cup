class Post < ApplicationRecord
    belongs_to :user
    has_many :images
    accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true
    #バリデーション
    validates :product_name ,presence: true,length:{maximum:25}
    validates :title, presence:true,length:{maximum:30}
    validates :price, presence: true,numericality: true,length:{maximum:10}
    validates :review, length:{maximum:500},presence: true
end
