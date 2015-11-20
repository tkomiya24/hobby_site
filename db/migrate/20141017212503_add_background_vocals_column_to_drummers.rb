class AddBackgroundVocalsColumnToDrummers < ActiveRecord::Migration
  def up
    add_column('drummers', 'background_vocals', :boolean, default: false, after: 'user_id')
  end

  def down
    remove_column('drummers', 'background_vocals')
  end
end
