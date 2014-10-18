class CreateGuitarists < ActiveRecord::Migration
  def change
    create_table :guitarists do |t|

      t.references :user
      t.boolean "background_vocals", :null => false, :default => false
      t.string "rhythm_or_lead", :null => false
      t.integer "experience", :default => 0, :null => false
      t.integer "rating", :default => 0
      t.string "proficiency"
      t.timestamps

    end

    add_index "guitarists", "user_id"
  end
end
