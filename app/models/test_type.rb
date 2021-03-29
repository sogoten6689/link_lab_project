class TestType < ApplicationRecord
  validates :en_name, presence: true
  validates :vi_name, presence: true
end
