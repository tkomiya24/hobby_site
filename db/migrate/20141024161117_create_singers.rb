class CreateSingers < ActiveRecord::Migration
  def change
    create_table :singers do |t|
      t.boolean 'background_vocals', null: false, default: false
      t.string 'range'
      t.integer 'experience', default: 0, null: false
      t.integer 'rating', default: 0
      t.string 'proficiency'
      t.timestamps
    end
  end
end
