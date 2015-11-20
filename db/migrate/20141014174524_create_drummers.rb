class CreateDrummers < ActiveRecord::Migration
  def change
    create_table :drummers do |t|
      t.references :user
      t.boolean 'double_kick', null: false, default: false
      t.integer 'experience', default: 0, null: false
      t.integer 'rating', default: 0
      t.string 'proficiency'
      t.timestamps
    end

    add_index 'drummers', 'user_id'
  end
end
