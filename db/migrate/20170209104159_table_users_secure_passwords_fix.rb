class TableUsersSecurePasswordsFix < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :passord_digest, :password_digest 
  end
end
