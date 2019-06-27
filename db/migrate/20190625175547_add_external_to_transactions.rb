class AddExternalToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :external, :boolean
  end
end
