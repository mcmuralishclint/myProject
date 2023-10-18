class AddIndexesToCourse < ActiveRecord::Migration[7.0]
  def change
    add_index :courses, :name
    add_index :courses, :author
  end
end
