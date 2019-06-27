class ChangeUserColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :transactions, :user, :email
  end
end
