class LabTest < ApplicationRecord
  belongs_to :raw_test
  belongs_to :lab
  has_many :result_test

end
