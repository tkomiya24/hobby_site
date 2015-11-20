class AddSingersForeingKeyToUsers < ActiveRecord::Migration
  def change
    add_column('users', 'singer_id', :integer)
  end
end
