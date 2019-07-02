class User < ApplicationRecord
   mount_uploader :image_name, ImageUploader
   has_secure_password
end
