class User < ApplicationRecord
   mount_uploader :image_name, ImageUploader
   validates :name , presence: true , length: {in: 5..12} #5文字以上12文字以内
   validates :email , presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                     uniqueness: true
   has_secure_password
   has_many :posts
end
