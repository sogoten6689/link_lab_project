class TestType < ApplicationRecord
  has_many :raw_test

  # validates :en_name, presence: true, uniqueness: true
  validates :vi_name, presence: true, uniqueness: true

end
