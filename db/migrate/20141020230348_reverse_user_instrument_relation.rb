class ReverseUserInstrumentRelation < ActiveRecord::Migration
  # note, the model files must now also be updated to reverse the belongs_to and has_one relation.
  def up
    remove_column('bassists', 'user_id')
    remove_column('drummers', 'user_id')
    remove_column('guitarists', 'user_id')
    add_column('users', 'drummer_id', :integer)
    add_column('users', 'guitarist_id', :integer)
    add_column('users', 'bassist_id', :integer)
  end

  def down
    remove_column('users', 'bassist_id')
    remove_column('users', 'guitarist_id')
    remove_column('users', 'drummer_id')
    add_column('guitarists', 'user_id', :integer)
    add_index('guitarists', 'user_id')
    add_column('drummers', 'user_id', :integer)
    add_index('drummers', 'user_id')
    add_column('bassists', 'user_id', :integer)
    add_index('bassists', 'user_id')
  end
end
