class CreateBassists < ActiveRecord::Migration
  def change
    create_table :bassists do |t|
      t.references :user
      t.boolean 'background_vocals', null: false, default: false
      t.boolean 'five_string', null: false, default: false
      t.boolean 'six_string', null: false, default: false
      t.integer 'experience', default: 0, null: false
      t.integer 'rating', default: 0
      t.string 'proficiency'
      t.timestamps
    end
  end
end
