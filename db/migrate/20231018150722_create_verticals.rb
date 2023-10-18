class CreateVerticals < ActiveRecord::Migration[7.0]
  def change
    create_table :verticals do |t|
      t.string :name

      t.timestamps
    end
  end
end
