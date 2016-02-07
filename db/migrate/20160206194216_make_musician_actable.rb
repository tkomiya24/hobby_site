class MakeMusicianActable < ActiveRecord::Migration
  def change
    change_table :musicians do |t|
      t.actable index: true
      t.remove_references :instrument, polymorphic: true, index: true, null: false
    end
  end
end
