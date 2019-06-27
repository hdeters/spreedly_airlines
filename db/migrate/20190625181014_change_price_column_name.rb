class ChangePriceColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :transactions, :price, :amount
  end
end
