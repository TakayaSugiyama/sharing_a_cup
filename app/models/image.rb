class Image < ApplicationRecord
  belongs_to :post
  validates :image_name, presence: true
  mount_uploader :image_name,PhotoUploader
end
