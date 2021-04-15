class RawTest < ApplicationRecord
  belongs_to :test_type
  has_many :lab_test

  validates :name, presence: true, uniqueness: true
  validates :cost, presence: true
  validates :tax, presence: true
  validates :test_type_id, presence: true
end
