class AddCoordinatesToOrganisms < ActiveRecord::Migration
  def up
    add_column :organisms, :x, :integer
    add_column :organisms, :y, :integer
  end

  def down
    remove_column :organisms, :x
    remove_column :organisms, :y
  end
end
