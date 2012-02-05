class AddSizeFieldsToPlanet < ActiveRecord::Migration
  def up
    add_column :planets, :width, :integer
    add_column :planets, :height, :integer
  end

  def down
    remove_column :planets, :width
    remove_column :planets, :height
  end
end
