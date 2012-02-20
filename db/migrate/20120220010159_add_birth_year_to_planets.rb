class AddBirthYearToPlanets < ActiveRecord::Migration
  def up
    add_column :planets, :birth_year, :integer
  end

  def down
    remove_column :planets, :birth_year
  end
end
