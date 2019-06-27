class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.numeric :user
      t.references :flight, foreign_key: true
      t.numeric :price

      t.timestamps
    end
  end
end
