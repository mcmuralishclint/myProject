class Category < ApplicationRecord
  belongs_to :vertical
  has_one :course, dependent: :destroy

  validates :name, uniqueness_across_models: true

  enum state: { active: 1, inactive: 0 }
end
