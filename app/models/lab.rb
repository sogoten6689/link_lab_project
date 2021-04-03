class Lab < ApplicationRecord
  belongs_to :user, optional: true
end
