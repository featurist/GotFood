class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :telephone_number
      t.string :postcode

      t.timestamps
    end
  end
end
