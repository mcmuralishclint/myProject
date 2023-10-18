class AddIndexesToCategory < ActiveRecord::Migration[7.0]
  def change
    add_index :categories, :name
  end
end
