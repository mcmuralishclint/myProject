class Course < ApplicationRecord
  belongs_to :category
  enum state: { active: 1, inactive: 0 }
end
