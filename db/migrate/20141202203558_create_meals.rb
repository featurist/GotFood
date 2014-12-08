class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.text :description
      t.references :restaurant
      t.timestamps
    end
  end
end
