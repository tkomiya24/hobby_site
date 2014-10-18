class DrummersBackgroundVocalsColumnNotNullable < ActiveRecord::Migration

  def change

  	change_column("drummers", "background_vocals", :boolean, :default => false, :null => false)
  end

  def down
  	change_column("drummers", "background_vocals", :boolean, :default => false)
  end
end
