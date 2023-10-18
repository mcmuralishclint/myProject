class Category < ApplicationRecord
  belongs_to :vertical
  has_one :course, dependent: :destroy

  enum state: { active: 1, inactive: 0 }
end
