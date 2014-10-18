class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string "username", :null => false
      t.string "hashed_password", :limit => 20, :null => false
      t.string "first_name"
      t.string "last_name"
      t.string "email"
      t.string "city"
      t.timestamps
    end

    add_index("users", "username")
  end
end
