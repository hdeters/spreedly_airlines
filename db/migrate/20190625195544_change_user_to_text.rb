class ChangeUserToText < ActiveRecord::Migration[5.0]
  def change
    change_column :transactions, :email, :string
  end
end
