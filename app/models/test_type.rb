class TestType < ApplicationRecord
  has_many :raw_test

  validates :en_name, presence: true
  validates :vi_name, presence: true

end
