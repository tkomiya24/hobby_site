class AddBcryptSecurityToUser < ActiveRecord::Migration

  def up
  	remove_column 'users', 'hashed_password'
  	add_column 'users', 'password_digest', :string
  end

  def down
  	remove_column 'users','password_digest'
  	add_column 'users', 'hashed_password', :string, :limit => 20, :null => false
  end

end
