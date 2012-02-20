class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :year

      t.timestamps
    end
  end
end
