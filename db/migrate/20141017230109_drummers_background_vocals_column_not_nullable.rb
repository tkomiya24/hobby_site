class DrummersBackgroundVocalsColumnNotNullable < ActiveRecord::Migration
  def up
    change_column('drummers', 'background_vocals', :boolean, default: false, null: false)
  end

  def down
    change_column('drummers', 'background_vocals', :boolean, default: false)
  end
end
