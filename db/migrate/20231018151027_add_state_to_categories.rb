class AddStateToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :state, :integer, default: 0
  end
end
