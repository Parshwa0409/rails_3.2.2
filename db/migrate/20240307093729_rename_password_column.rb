class RenamePasswordColumn < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :password, :password_digest

    change_column_null :users, :email, false
  end
end
