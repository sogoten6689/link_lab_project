class Doctor < ApplicationRecord
  belongs_to :user
  belongs_to :lab

  def email

  end

end
