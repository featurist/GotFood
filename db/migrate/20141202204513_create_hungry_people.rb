class CreateHungryPeople < ActiveRecord::Migration
  def change
    create_table :hungry_people do |t|
      t.string :telephone_number

      t.timestamps
    end
  end
end
