class CreateMusicalHobbies < ActiveRecord::Migration
  def change
    create_table :musical_hobbies do |t|
      t.timestamps null: false
    end
  end
end
