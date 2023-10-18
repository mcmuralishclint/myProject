class Vertical < ApplicationRecord
  has_one :category, dependent: :destroy
end
