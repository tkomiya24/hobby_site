class CreateMusicalHobbies < ActiveRecord::Migration
  def up
    create_table :musical_hobbies do |t|
      t.boolean 'background_vocals', default: false
      t.integer 'experience', default: 0
      t.string 'proficiency'
      t.timestamps null: false
      t.references :user, index: true, null: false
      t.references :instrument, polymorphic: true, index: true, null: false
    end
  end

  def down
    drop_table :musical_hobbies
  end
end
