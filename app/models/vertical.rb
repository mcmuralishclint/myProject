class Vertical < ApplicationRecord
  has_one :category, dependent: :destroy
  validates :name, uniqueness_across_models: true
  validates_uniqueness_of :name
end
