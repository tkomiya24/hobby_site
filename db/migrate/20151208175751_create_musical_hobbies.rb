class CreateMusicalHobbies < ActiveRecord::Migration
  def up
    create_table :musical_hobbies do |t|
      t.timestamps null: false
      t.references :user, index: true
    end
  end

  def down
    drop_table :musical_hobbies
  end
end
