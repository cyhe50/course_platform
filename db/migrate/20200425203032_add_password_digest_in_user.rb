class AddPasswordDigestInUser < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :passward, :password_digest
  end
end
