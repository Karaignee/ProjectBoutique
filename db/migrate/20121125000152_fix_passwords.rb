class FixPasswords < ActiveRecord::Migration
  def up
  	rename_column :users, :password, :hashed_password
  end
end
