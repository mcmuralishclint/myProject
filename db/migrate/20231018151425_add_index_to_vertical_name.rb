class AddIndexToVerticalName < ActiveRecord::Migration[7.0]
  def change
    add_index :verticals, :name
  end
end
