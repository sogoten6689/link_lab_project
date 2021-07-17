class Post < ApplicationRecord
  belongs_to :user
  # belongs_to :lab

  mount_uploader :image, ImageUploader
end
