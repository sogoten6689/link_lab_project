class ResultTest < ApplicationRecord
  has_one :lab_test
  enum status: [:new, :processing, :finished], _suffix: true
end
