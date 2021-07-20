class UserTest < ApplicationRecord
  # belongs_to :raw_test
  # belongs_to :lab_test
  has_many :result_test

  enum status: [:new, :processing, :finished], _suffix: true

  attr_accessor :lab_test_ids

  mount_uploader :image, ImageUploader
end
