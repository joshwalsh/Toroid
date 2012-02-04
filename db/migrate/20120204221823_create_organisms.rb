class CreateOrganisms < ActiveRecord::Migration
  def change
    create_table :organisms do |t|
      t.string :name
      t.integer :planet_id

      t.timestamps
    end
  end
end
