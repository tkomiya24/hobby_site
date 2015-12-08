class CreateMusicalHobbies < ActiveRecord::Migration
  def up
    create_table :musical_hobbies do |t|
      t.timestamps null: false
      t.references :user
    end
    add_index :musical_hobbies, :user_id
  end

  def down
    drop_table :musical_hobbies
  end
end
